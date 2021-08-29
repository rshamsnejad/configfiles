function fish_prompt --description "SuperBoby's prompt"
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.
    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color --bold $fish_color_status)
    set -l pipestatus_string (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)

    set -g __fish_git_prompt_show_informative_status 1
    set -g __fish_git_prompt_hide_untrackedfiles 1

    set -g __fish_git_prompt_color_branch magenta --bold
    set -g __fish_git_prompt_showupstream "informative"
    set -g __fish_git_prompt_char_upstream_ahead "↑"
    set -g __fish_git_prompt_char_upstream_behind "↓"
    set -g __fish_git_prompt_char_upstream_prefix ""

    set -g __fish_git_prompt_char_stagedstate "●"
    set -g __fish_git_prompt_char_dirtystate "✚"
    set -g __fish_git_prompt_char_untrackedfiles "…"
    set -g __fish_git_prompt_char_conflictedstate "✖"
    set -g __fish_git_prompt_char_cleanstate "✔"

    set -g __fish_git_prompt_color_dirtystate blue
    set -g __fish_git_prompt_color_stagedstate yellow
    set -g __fish_git_prompt_color_invalidstate red
    set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
    set -g __fish_git_prompt_color_cleanstate green --bold

    if functions -q fish_is_root_user; and fish_is_root_user
        set user_color (set_color white -b red)
        set suffix '#'
    else
        set user_color (set_color 00D7AF)
        set suffix '$'
    end

    printf '%s%s%s@%s%s %s: %s%s\n%s[%s]%s%s ' \
        $user_color $USER \
        (set_color white) \
        (set_color 00AFFF) (prompt_hostname) \
        (set_color white) \
        (set_color 99FFFF) $PWD \
        (set_color brred) (date "+%H:%M:%S") \
        (set_color normal) (fish_vcs_prompt)

    if test -n $pipestatus_string
        echo -n $pipestatus_string" "
    end

    echo -n "$suffix "
end