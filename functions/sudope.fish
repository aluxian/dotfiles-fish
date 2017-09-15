# https://github.com/oh-my-fish/plugin-sudope
function sudope -d "Quickly toggle sudo prefix"
  # save the current command buffer and cursor position
  set -l command_buffer (commandline)
  set -l cursor_position (commandline -C)

  # if the command buffer is empty, pull the previous command from history
  if test -z $command_buffer
    set command_buffer $history[1]
    set cursor_position (string length $history[1])
  end

  # parse the command buffer
  set -l command_parts (string match -ir '^(\s*)(sudo(\s+|$))?(.*)' $command_buffer)
  switch (count $command_parts)
    # sudo is not present
    case 3
      # add sudo at the beginning of the command, after any leading whitespace (if present)
      commandline -r (string join '' $command_parts[2] 'sudo ' $command_parts[3])

      # push the cursor position ahead if necessary (+5 for 'sudo ')
      test $cursor_position -ge (string length $command_parts[2])
        and set cursor_position (math $cursor_position+5)

      # restore cursor position
      commandline -C $cursor_position

    # sudo is present at the beginning of the command
    case 5
      # remove sudo, leave any leading whitespace (if present)
      commandline -r (string join '' $command_parts[2 5])

      # push the cursor position back if appropriate ('sudo' and whitespace)
      set -l lead_length (string length $command_parts[2])
      set -l sudo_length (string length $command_parts[3])
      if test $cursor_position -ge (math $lead_length+$sudo_length)
        # the cursor was after sudo
        set cursor_position (math $cursor_position-$sudo_length)
      else if test $cursor_position -ge $lead_length
        # the cursor was somewhere in sudo
        set cursor_position $lead_length
      end

      # restore cursor position
      commandline -C -- $cursor_position
  end
end
