[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"

# Set prompt for zsh
# λ Hostname Path →
export PROMPT="%F{yellow}λ %m %F{green}%c %F{yellow}→ %f"

WORDCHARS=''

unsetopt menu_complete # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end

# Highlight selected tab option
zstyle ':completion:*:*:*:*:*' menu select
# Case insensitive and hyphen insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
# Complete . and .. special directories
zstyle ':completion:*' special-dirs true
# Show special colors for directories in auto complete options
zstyle ':completion:*' list-colors ''
# Copied from oh-my-zsh
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
# Disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path $ZSH_CACHE_DIR

autoload -U +X bashcompinit && bashcompinit
# Load auto completions
autoload -U compaudit compinit

# Move through text
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^b' backward-char
bindkey '^f' forward-char
bindkey '^d' delete-char-or-list

bindkey '^[b' backward-word
bindkey '^[f' forward-word

# Edit text
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^k' kill-line
bindkey '^u' kill-whole-line
bindkey '^[d' kill-word

bindkey '^v' quoted-insert
bindkey '^y' yank
bindkey '^[t' transpose-words
bindkey '^[w' copy-region-as-kill

# Move through history
bindkey '^P' up-line-or-history
bindkey '^N' down-line-or-history

bindkey '^r' history-incremental-search-backward
bindkey '^s' history-incremental-search-forward

bindkey '^q' push-line
bindkey '^g' get-line
bindkey '^[q' push-line
bindkey '^[g' get-line
bindkey '^[h' run-help

bindkey '^x=' what-cursor-position
bindkey '^[a' accept-and-hold # Run command but keep it in the prompt

# Expand !
bindkey ' ' magic-space

export SUDO_EDITOR='/home/erick/bin/nvim'
export EDITOR='nvim'
export VISUAL='nvim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

alias gst="git status"
alias gc="git commit -v"
alias gca="git commit -v --ammend"
alias gd="git diff"
alias gdc="git diff --cache"
alias gp="git push"
alias gl="git pull"
alias gg="git log --all --decorate --oneline --graph"
alias gaa="git add -A"
alias ga="git add"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gb="git branch"
alias gbD="git branch -D"

alias l="exa -lagh"
alias lrt="l -s modified"
alias ltr="lrt"
alias f="fg"
alias vim="nvim"
alias gg="git log --all --decorate --oneline --graph"
alias clippy="cargo clippy --all-features --all-targets --release -- -D warnings -Zunstable-options"
#alias cstdin="echo \"Ctrl-D once done\" && gcc -o ~/.stdin ~/.cstdin.c -O2 -Wall && ~/.stdin"
alias cstdin="gcc -o ~/.stdin ~/.cstdin.c -O2 -Wall && ~/.stdin"

export FZF_DEFAULT_COMMAND="fd --type f"
export CPPUTEST_HOME="$HOME/Projects/Github/cpputest"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# opam configuration
test -r /home/erick/.opam/opam-init/init.zsh && . /home/erick/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
