function fish_right_prompt -d 'Write out the prompt on the right-hand side'
  set -l last_status $status
  if test $last_status -eq 0
    echo -n -s (set_color green) $last_status (set_color normal)
  else
    echo -n -s (set_color red) $last_status (set_color normal)
  end
end
