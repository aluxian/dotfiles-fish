function fish_prompt
  echo -s (set_color $fish_color_cwd) (prompt_pwd) \
    (set_color yellow) (__fish_git_prompt) \
    (set_color blue) (__kube_prompt) \
    (set_color normal) \
    \n (set_color $fish_color_cwd) "~" \
    (set_color normal) "> "
end
