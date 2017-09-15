function fish_prompt -d 'Write out the prompt'
  set -l color_cwd
  set -l suffix

  switch $USER
    case root toor
      if set -q fish_color_cwd_root
        set color_cwd $fish_color_cwd_root
      else
        set color_cwd $fish_color_cwd
      end
      set suffix '#'
    case '*'
      set color_cwd $fish_color_cwd
      set suffix '>'
  end

  set -g fish_prompt_pwd_dir_length 0
  set -l cwd (prompt_pwd)

  echo -n -s (set_color $color_cwd) $cwd (__fish_git_prompt) (set_color normal) "$suffix "
end

