function fish_prompt
  set -l last_status $status
  set -l last_status_color "green"
  if test $last_status -ne 0
    set last_status_color "red"
  end

  echo -s \
    (set_color $last_status_color) $last_status \
    (set_color yellow) (__fish_git_prompt) \
    (set_color blue) (__kube_prompt) \
    (set_color $fish_color_cwd) " " (prompt_pwd) \
    (set_color normal) "> "
end
