# https://github.com/nvbn/thefuck/wiki/Shell-aliases
function fuck
  set -l fucked_up_command (commandline)

  if test -z $fucked_up_command
    set fucked_up_command $history[1]
  end

  if test -n $fucked_up_command
    env TF_ALIAS=fuck PYTHONIOENCODING=utf-8 THEFUCK_REQUIRE_CONFIRMATION=0 \
      thefuck $fucked_up_command ^/dev/null | read -l unfucked_command
    if test -n $unfucked_command
      commandline -r $unfucked_command
    end
  end
end
