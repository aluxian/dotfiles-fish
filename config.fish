# load virtualfish
eval (python -m virtualfish)

# load secret env vars
source ~/.config/fish/secrets.fish

# general env config
set -x EDITOR 'nvim'

# fzf env config
set -x FZF_ALT_C_COMMAND 'blsd'
set -x FZF_ALT_C_OPTS '--preview \'tree -C {} | head -200\''
set -x FZF_CTRL_T_COMMAND ag '--hidden --ignore .git -g ""'
set -x FZF_DEFAULT_COMMAND ag '--hidden --ignore .git -g ""'
set -x FZF_DEFAULT_OPTS '--no-height --no-reverse'

# go lang
set -x GOPATH $HOME/.go
set -x PATH $GOPATH/bin $PATH

# iOS fastlane
set -x PATH $HOME/.fastlane/bin $PATH
