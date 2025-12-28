# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/root/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git colored-man-pages zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# => 1. Auto-Suggestion Color (The "Ghost" text)
# I changed this to Grey (#6272a4) so it looks different from your typing.
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#6272a4,bold"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#6272a4"

# => 2. Syntax Highlighting Colors (The text you actually type)
ZSH_HIGHLIGHT_STYLES[command]='fg=#ff79c6,bold'       # Your commands stay Neon Pink
ZSH_HIGHLIGHT_STYLES[alias]='fg=#8be9fd,bold'         # Aliases are Cyan
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#50fa7b,bold'       # Built-in cmds are Green
ZSH_HIGHLIGHT_STYLES[path]='fg=#f1fa8c,underline'     # Paths are Yellow
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#ffb86c'           # Wildcards are Orange
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#ff5555,bold' # Errors are Red


# Load P10K config (we'll customize this next)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
