# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/root/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git colored-man-pages zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Your neon-pink autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff79c6,bold"

# Your syntax colors
ZSH_HIGHLIGHT_STYLES[command]='fg=#ff79c6,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#8be9fd,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#50fa7b,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=#f1fa8c,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#ffb86c'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#ff5555,bold'

# Load P10K config (we'll customize this next)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
