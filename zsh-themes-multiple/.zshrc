# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/root/.oh-my-zsh"

# Classic Kali boxed prompt but ONLY Saleem (no root@host)
#ZSH_THEME="spaceship"
#ZSH_THEME="refined"
#ZSH_THEME="avit"
#ZSH_THEME="jonathan"
#ZSH_THEME="fino-time"
#ZSH_THEME="arrow"
#ZSH_THEME="robbyrussell"
#ZSH_THEME="dracula"
ZSH_THEME="agnoster"
#ZSH_THEME="powerlevel10k/powerlevel10k"

#DEFAULT_USER="Saleem"

# THIS LINE IS THE ONLY ONE THAT MATTERS
#PROMPT='%B%F{cyan}Saleem%f %F{yellow}%~%f%b $ '
#PROMPT=$'\n┌──(%B%F{cyan}Saleem%f%b %F{yellow}%~%f)\n└─%B%F{magenta}❯%f%b '

#PROMPT="%F{#50fa7b}➜ %F{#f1fa8c}Saleem%f "

##This forces your name
PROMPT='%B%F{cyan}Saleem%f%b%F{reset} '$PROMPT  

# Keep your neon-pink suggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff79c6,bold"



plugins=(git colored-man-pages zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff79c6,bold"


# Paste this block at the end of /root/.zshrc
ZSH_HIGHLIGHT_STYLES[command]='fg=#ff79c6,bold'      # neon pink
ZSH_HIGHLIGHT_STYLES[alias]='fg=#8be9fd,bold'        # cyan
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#50fa7b,bold'      # green
ZSH_HIGHLIGHT_STYLES[path]='fg=#f1fa8c,underline'    # yellow path
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#ffb86c'          # orange *
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#ff5555,bold' # red invalid

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Spaceship settings (makes it look insane)
SPACESHIP_PROMPT_ORDER=(
  user          # Username (we'll hide it and show only Saleem)
  dir           # Current directory
  host          # Hostname (we'll hide it)
  git           # Git branch/status
  package       # Package version
  node          # Node.js version
  ruby          # Ruby version
  python        # Python version
  docker        # Docker status
  kubectl       # Kubernetes context
  terraform     # Terraform workspace
  exec_time     # Execution time
  line_sep      # Line break
  char          # Prompt character
)

# Show only Saleem instead of root@host
SPACESHIP_USER_SHOW="always"
SPACESHIP_USER_PREFIX=""
SPACESHIP_USER_SUFFIX=""
SPACESHIP_USER_COLOR="cyan"

PROMPT='%B%F{cyan}Saleem%f%b%F{reset} '$PROMPT   # This forces your name

# Keep your neon-pink suggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff79c6,bold"
