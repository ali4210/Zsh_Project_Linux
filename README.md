# 🚀 Ultimate Zsh + Powerlevel10k Terminal Setup

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Shell: Zsh](https://img.shields.io/badge/Shell-Zsh-green.svg)](https://www.zsh.org/)
[![Works on: All Linux](https://img.shields.io/badge/Works%20on-All%20Linux-blue.svg)]()

> **Transform your Linux terminal into a beautiful, productive powerhouse in under 5 minutes!**

A production-ready, universal Zsh configuration that works flawlessly across **ALL** Linux distributions. Perfect for DevOps engineers, system administrators, developers, and anyone who wants a stunning terminal experience.

![Terminal Preview](https://via.placeholder.com/800x100/282a36/ff79c6?text=Saleem+~/project+(main)+%E2%9A%A1)

## ✨ What You'll Get

- 🎨 **Beautiful Powerlevel10k Theme** - Modern, fast, and customizable
- 💡 **Intelligent Autosuggestions** - Neon-pink suggestions as you type
- 🌈 **Advanced Syntax Highlighting** - Color-coded commands for better readability
- ⚡ **Lightning Fast** - Instant prompt with zero lag
- 🔧 **Git Integration** - Visual branch and status indicators
- 📊 **Command Execution Time** - Track how long commands take
- 🎯 **Universal Compatibility** - Works on Ubuntu, Debian, Kali, Parrot, CentOS, RHEL, Fedora, Arch, openSUSE, and more
- 👤 **Clean Username Display** - Shows only your name, no clutter
- 🔐 **Root Support** - Same beautiful experience for root user

## 📸 Final Result

```bash
Saleem ~/Kubernetes-Labs (main) ⚡
```

**Features visible in prompt:**
- Custom username (Saleem)
- Current directory
- Git branch and status
- Clean, minimal design

---

## 🎯 Prerequisites

### Required: Zsh Shell

**⚠️ CRITICAL:** This setup **requires Zsh**. Bash cannot support these features.

**Check if you have Zsh:**
```bash
zsh --version
```

If you get an error, follow the installation steps below.

---

## 📦 Installation Guide

### Step 0: Install Zsh (If Not Already Installed)

This universal command detects your Linux distribution and installs Zsh automatically:

```bash
# Universal Zsh installation (works on all major distros)
sudo apt install zsh git curl -y 2>/dev/null || \
sudo dnf install zsh git curl -y 2>/dev/null || \
sudo yum install zsh git curl -y 2>/dev/null || \
sudo pacman -Sy zsh git curl --noconfirm 2>/dev/null || \
sudo zypper in -y zsh git curl 2>/dev/null || \
sudo apk add zsh git curl 2>/dev/null
```

**Set Zsh as your default shell:**
```bash
chsh -s $(which zsh)
```

**⚠️ Important:** Log out and log back in for changes to take effect.

**Verify installation:**
```bash
echo $SHELL
# Should output: /usr/bin/zsh or /bin/zsh
```

---

### Step 1: Clean Slate (Recommended for Fresh Start)

If you're experiencing issues or want a fresh installation, run this first:

```bash
# Remove existing configurations (safe - only removes config files)
rm -rf ~/.oh-my-zsh ~/.zshrc ~/.p10k.zsh ~/.zcompdump* ~/.cache/p10k* 2>/dev/null
sudo rm -rf /root/.oh-my-zsh /root/.zshrc /root/.p10k.zsh /root/.zcompdump* 2>/dev/null

echo "✅ Clean slate ready! Proceeding with fresh installation..."
```

---

### Step 2: Install Oh-My-Zsh Framework

Oh-My-Zsh is the foundation that powers everything.

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
```

**What just happened?**
- Installed Oh-My-Zsh framework
- Created `~/.oh-my-zsh` directory
- Set up basic Zsh configuration

**⚠️ Note:** If a new Zsh shell opens automatically, type `exit` to continue.

---

### Step 3: Install Powerlevel10k Theme

Powerlevel10k is the beautiful theme you'll see in your terminal.

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
```

**Why Powerlevel10k?**
- ⚡ Lightning fast
- 🎨 Beautiful out of the box
- 🔧 Highly customizable
- 📊 Shows git status, execution time, and more

---

### Step 4: Install Essential Plugins

These plugins supercharge your terminal experience.

```bash
# Autosuggestions - suggests commands as you type
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Syntax highlighting - colors your commands
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

**What these plugins do:**
- **zsh-autosuggestions:** Shows command suggestions based on your history (Accept with →)
- **zsh-syntax-highlighting:** Colors commands green (valid) or red (invalid) as you type

---

### Step 5: Apply Custom Configuration

Now let's create the beautiful configuration file:

```bash
cat > ~/.zshrc << 'EOF'
# Enable Powerlevel10k instant prompt (faster startup)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Oh-My-Zsh configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Load plugins
plugins=(
  git                      # Git aliases and functions
  colored-man-pages        # Colorful man pages
  zsh-autosuggestions     # Command suggestions
  zsh-syntax-highlighting  # Syntax highlighting
  docker                   # Docker completions (optional)
  kubectl                  # Kubernetes completions (optional)
)

source $ZSH/oh-my-zsh.sh

# Neon-pink autosuggestions style
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff79c6,bold"

# Beautiful syntax highlighting colors
ZSH_HIGHLIGHT_STYLES[command]='fg=#ff79c6,bold'           # Commands in pink
ZSH_HIGHLIGHT_STYLES[alias]='fg=#8be9fd,bold'             # Aliases in cyan
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#50fa7b,bold'           # Builtins in green
ZSH_HIGHLIGHT_STYLES[path]='fg=#f1fa8c,underline'         # Paths in yellow
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#ffb86c'               # Wildcards in orange
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#ff5555,bold'     # Errors in red

# Load Powerlevel10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Custom aliases (add your own below)
alias ls='ls --color=auto'
alias ll='ls -lah'
alias grep='grep --color=auto'
alias update='sudo apt update && sudo apt upgrade -y'  # For Debian/Ubuntu
# alias update='sudo dnf update -y'                    # Uncomment for Fedora/RHEL
# alias update='sudo pacman -Syu'                      # Uncomment for Arch
EOF
```

---

### Step 6: Configure Powerlevel10k Theme

This configuration creates the clean, professional look:

```bash
cat > ~/.p10k.zsh << 'EOF'
# Powerlevel10k Configuration
# This file defines how your prompt looks

# Show custom username (change "Saleem" to your name)
typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='Saleem'
typeset -g POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE='Saleem'
typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=51          # Cyan color
typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=51     # Same for root

# Left side of prompt (what you see before cursor)
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  context      # Username
  dir          # Current directory
  vcs          # Git status
)

# Right side of prompt (what you see after your commands)
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  status                    # Exit code of last command
  command_execution_time    # How long command took
  time                      # Current time
)

# Visual style settings
typeset -g POWERLEVEL9K_MODE=nerdfont-complete         # Use Nerd Fonts
typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true        # Add newline before prompt
typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='❯ '

# Git settings
typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=76        # Green for clean repos
typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=178    # Orange for modified repos
typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=214   # Yellow for untracked files

# Directory colors
typeset -g POWERLEVEL9K_DIR_FOREGROUND=39              # Bright cyan
typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=39
typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=39

# Instant prompt settings (for speed)
typeset -g POWERLEVEL9K_INSTANT_PROMPT=verbose
EOF
```

**📝 Customization Tip:** Change `'Saleem'` to your own name in the configuration above!

---

### Step 7: Apply Configuration

Reload your configuration to see the changes:

```bash
source ~/.zshrc
```

**🎉 Congratulations!** Your terminal should now look amazing!

---

### Step 8: Enable for Root User (Optional but Recommended)

Give the root user the same beautiful experience:

```bash
# Install Oh-My-Zsh for root
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

# Install theme for root
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/.oh-my-zsh/custom/themes/powerlevel10k

# Install plugins for root
sudo git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions /root/.oh-my-zsh/custom/plugins/zsh-autosuggestions
sudo git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting /root/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Copy configuration to root
sudo cp ~/.zshrc ~/.p10k.zsh /root/
sudo chown root:root /root/.zshrc /root/.p10k.zsh

# Set Zsh as root's default shell
sudo chsh -s $(which zsh) root
```

**Test it:**
```bash
sudo -i
# You should see the same beautiful prompt!
```

---

## 🎨 Additional Customization Options

### Change Your Display Name

Edit `~/.p10k.zsh` and find:
```bash
typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='Saleem'
```

Change `'Saleem'` to your name, then reload:
```bash
source ~/.zshrc
```

### Add More Plugins

**Important:** Oh-My-Zsh comes with 300+ plugins **pre-installed**! You don't need to download them separately. Just add their names to the plugins array to activate them.

Edit `~/.zshrc` and add plugins to the `plugins=()` array:

```bash
plugins=(
  git
  colored-man-pages
  zsh-autosuggestions
  zsh-syntax-highlighting
  docker           # Docker completions (requires Docker installed)
  kubectl          # Kubernetes completions (requires kubectl installed)
  terraform        # Terraform completions (requires Terraform installed)
  npm              # NPM completions (requires Node.js/npm installed)
  python           # Python completions (requires Python installed)
  pip              # Pip completions (requires Python pip installed)
)
```

**⚠️ Important Notes:**
1. **Built-in plugins** (like docker, kubectl, terraform) are already included with Oh-My-Zsh - just add them to activate
2. **The actual tools must be installed** for plugins to work (e.g., Docker must be installed for docker plugin to be useful)
3. **Custom plugins** (like zsh-autosuggestions and zsh-syntax-highlighting) need to be installed separately (already covered in Step 4)

**Popular built-in plugin options:**
- `docker` - Docker command completions and aliases
- `kubectl` - Kubernetes completions and aliases (k, kgp, kgs, etc.)
- `terraform` - Terraform completions
- `aws` - AWS CLI completions
- `gcloud` - Google Cloud CLI completions
- `azure` - Azure CLI completions
- `npm` - Node package manager completions
- `python` - Python completions
- `pip` - Pip completions
- `sudo` - Press ESC twice to add sudo to command
- `systemd` - Systemd service completions
- `ansible` - Ansible completions
- `vagrant` - Vagrant completions
- `helm` - Helm completions

**How to install the actual tools (examples):**

```bash
# Docker (Ubuntu/Debian)
sudo apt install docker.io -y

# kubectl (Universal)
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Terraform (Universal)
wget https://releases.hashicorp.com/terraform/1.6.0/terraform_1.6.0_linux_amd64.zip
unzip terraform_1.6.0_linux_amd64.zip
sudo mv terraform /usr/local/bin/

# Node.js & npm (Ubuntu/Debian)
sudo apt install nodejs npm -y

# Python & pip (Usually pre-installed, but if needed)
sudo apt install python3 python3-pip -y

# AWS CLI (Universal)
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

After installing any tools, reload your configuration:
```bash
source ~/.zshrc
```

### Change Colors

Edit `~/.zshrc` and modify the color codes:

```bash
# Color format: fg=#RRGGBB (hex color code)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff79c6,bold"  # Change #ff79c6 to any color
```

**Popular color schemes:**
- `#ff79c6` - Neon pink (current)
- `#8be9fd` - Cyan
- `#50fa7b` - Green
- `#ffb86c` - Orange
- `#bd93f9` - Purple

---

## 🔧 Troubleshooting

### Issue 1: "zsh: command not found: zsh"

**Solution:** Zsh is not installed. Run Step 0 again.

```bash
# Try this universal installer again
sudo apt install zsh -y 2>/dev/null || \
sudo dnf install zsh -y 2>/dev/null || \
sudo yum install zsh -y 2>/dev/null || \
sudo pacman -Sy zsh --noconfirm 2>/dev/null
```

---

### Issue 2: Prompt looks broken or shows weird characters

**Cause:** Missing Nerd Fonts (fonts with special icons)

**Solution:** Install a Nerd Font:

**For local terminal (Linux desktop):**
```bash
# Download and install Nerd Font
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
fc-cache -fv
```

Then set your terminal to use "MesloLGS NF" font.

**For SSH/remote connections:**
Install the font on your **local machine** (Windows/Mac/Linux) and set your SSH client (PuTTY, Windows Terminal, iTerm2) to use "MesloLGS NF".

---

### Issue 3: Autosuggestions not appearing

**Solution:**

1. Check if plugin is loaded:
```bash
grep "zsh-autosuggestions" ~/.zshrc
```

2. If not found, reinstall:
```bash
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

3. Ensure it's in your plugins list in `~/.zshrc`:
```bash
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
```

4. Reload:
```bash
source ~/.zshrc
```

---

### Issue 4: Colors not showing

**Solution:**

1. Check terminal color support:
```bash
echo $TERM
# Should show: xterm-256color or similar
```

2. If not, add to `~/.zshrc`:
```bash
export TERM=xterm-256color
```

3. For SSH connections, ensure your local terminal supports colors.

---

### Issue 5: Slow prompt loading

**Cause:** Large Git repositories or slow network mounts

**Solution:**

1. Disable git status for large repos:
```bash
# Add to ~/.zshrc
POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY=4096
```

2. Or disable instant prompt by removing this from `~/.p10k.zsh`:
```bash
typeset -g POWERLEVEL9K_INSTANT_PROMPT=verbose
```

---

### Issue 6: Configuration not applying

**Solution:**

1. Check for syntax errors:
```bash
zsh -n ~/.zshrc
```

2. If errors found, restore from this guide

3. Make sure you're reloading:
```bash
source ~/.zshrc
```

4. Or restart your terminal completely

---

### Issue 7: "Permission denied" errors

**Solution:**

```bash
# Fix ownership of Oh-My-Zsh files
chown -R $USER:$USER ~/.oh-my-zsh
chmod -R 755 ~/.oh-my-zsh
```

---

### Issue 8: Root user not working

**Solution:**

1. Check if root is using Zsh:
```bash
sudo echo $SHELL
```

2. If not `/usr/bin/zsh`, set it:
```bash
sudo chsh -s $(which zsh) root
```

3. Verify root configuration exists:
```bash
sudo ls -la /root/.zshrc /root/.p10k.zsh
```

4. If missing, copy again:
```bash
sudo cp ~/.zshrc ~/.p10k.zsh /root/
sudo chown root:root /root/.zshrc /root/.p10k.zsh
```

---

### Issue 9: Git branch not showing

**Cause:** Git not installed or not in a Git repository

**Solution:**

1. Install Git:
```bash
sudo apt install git -y  # Debian/Ubuntu
sudo dnf install git -y  # Fedora/RHEL
sudo pacman -S git       # Arch
```

2. Initialize a Git repo to test:
```bash
cd ~
mkdir test-repo
cd test-repo
git init
# You should now see (main) or (master) in your prompt
```

---

### Issue 10: Want to completely uninstall

**Solution:**

```bash
# Remove all configurations
rm -rf ~/.oh-my-zsh ~/.zshrc ~/.p10k.zsh ~/.zcompdump* ~/.cache/p10k*
sudo rm -rf /root/.oh-my-zsh /root/.zshrc /root/.p10k.zsh /root/.zcompdump*

# Switch back to Bash
chsh -s $(which bash)
sudo chsh -s $(which bash) root

# Log out and log back in
```

---

---

## 🔌 Understanding Oh-My-Zsh Plugins

### Two Types of Plugins:

#### 1. **Built-in Plugins** (Already Included with Oh-My-Zsh)
These plugins come pre-installed when you install Oh-My-Zsh. You just need to add their names to your `~/.zshrc` to activate them.

**Examples:** docker, kubectl, terraform, aws, npm, python, pip, git, systemd, ansible, vagrant, helm

**Location:** `~/.oh-my-zsh/plugins/`

**How to use:**
```bash
# Just add to plugins array in ~/.zshrc
plugins=(git docker kubectl terraform)
```

**Important:** The plugin provides shortcuts and autocompletion, but you must have the actual tool installed on your system!

#### 2. **Custom/Community Plugins** (Need Manual Installation)
These plugins are not included with Oh-My-Zsh and must be installed separately.

**Examples:** zsh-autosuggestions, zsh-syntax-highlighting, zsh-completions

**How to install:** Already covered in Step 4 of installation guide

---

### Quick Reference: Do I Need to Install This Plugin?

| Plugin Name | Comes with Oh-My-Zsh? | Need Tool Installed? | How to Activate |
|-------------|----------------------|---------------------|-----------------|
| `git` | ✅ Yes | ✅ Yes (git) | Add to plugins array |
| `docker` | ✅ Yes | ✅ Yes (docker) | Add to plugins array |
| `kubectl` | ✅ Yes | ✅ Yes (kubectl) | Add to plugins array |
| `terraform` | ✅ Yes | ✅ Yes (terraform) | Add to plugins array |
| `aws` | ✅ Yes | ✅ Yes (aws-cli) | Add to plugins array |
| `npm` | ✅ Yes | ✅ Yes (nodejs/npm) | Add to plugins array |
| `python` | ✅ Yes | ✅ Yes (python) | Add to plugins array |
| `zsh-autosuggestions` | ❌ No | ❌ No | Install manually (Step 4) |
| `zsh-syntax-highlighting` | ❌ No | ❌ No | Install manually (Step 4) |

---

## 📚 Understanding Key Concepts

### What is Zsh?

Zsh (Z Shell) is a powerful shell that extends Bash with features like:
- Better tab completion
- Spelling correction
- Plugin support
- Theme support
- Advanced globbing (file matching)

### What is Oh-My-Zsh?

A framework for managing Zsh configuration. It provides:
- 300+ plugins
- 150+ themes
- Auto-update functionality
- Easy configuration management

### What is Powerlevel10k?

A Zsh theme that provides:
- Lightning-fast prompt rendering
- Git status integration
- Command execution time
- Highly customizable segments
- Icons and colors

### How Do Plugins Work?

Plugins are scripts that add functionality:
- **zsh-autosuggestions:** Learns from your command history
- **zsh-syntax-highlighting:** Validates commands in real-time
- **git plugin:** Adds aliases like `gst` (git status), `gco` (git checkout)

---

## 🚀 Pro Tips & Best Practices

### 1. Useful Aliases to Add

Add these to your `~/.zshrc`:

```bash
# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Safety
alias rm='rm -i'      # Confirm before delete
alias cp='cp -i'      # Confirm before overwrite
alias mv='mv -i'      # Confirm before move

# System
alias ports='netstat -tulanp'
alias meminfo='free -m -l -t'
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# Git shortcuts (if not using git plugin aliases)
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'

# Docker shortcuts
alias dps='docker ps'
alias dimg='docker images'
alias dstop='docker stop $(docker ps -aq)'
alias drm='docker rm $(docker ps -aq)'

# Kubernetes shortcuts
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kgd='kubectl get deployments'
```

### 2. Accept Autosuggestions Quickly

- **→ (Right Arrow):** Accept entire suggestion
- **Ctrl + →:** Accept one word
- **End Key:** Accept entire suggestion

### 3. Search Command History

- **Ctrl + R:** Search backward through history
- **Ctrl + S:** Search forward through history
- Type to filter, Enter to execute

### 4. Directory Navigation

- **cd -:** Go to previous directory
- **~:** Home directory (`cd ~`)
- **..:** Parent directory (`cd ..`)

### 5. Keep Your Setup Updated

```bash
# Update Oh-My-Zsh
omz update

# Update plugins manually
cd ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions && git pull
cd ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting && git pull
cd ~/.oh-my-zsh/custom/themes/powerlevel10k && git pull
```

### 6. Backup Your Configuration

```bash
# Backup your configs
cp ~/.zshrc ~/zshrc.backup
cp ~/.p10k.zsh ~/p10k.backup

# Store in Git (recommended)
cd ~
git init
git add .zshrc .p10k.zsh
git commit -m "My Zsh configuration"
git remote add origin YOUR_GITHUB_REPO
git push -u origin main
```

---

## 🎓 For DevOps Engineers & System Administrators

### Essential DevOps Plugins

Add these to your `~/.zshrc` plugins array:

```bash
plugins=(
  git
  docker
  docker-compose
  kubectl
  terraform
  ansible
  aws
  gcloud
  azure
  helm
  vagrant
  systemd
  colored-man-pages
  zsh-autosuggestions
  zsh-syntax-highlighting
)
```

### Create Environment-Specific Prompts

Differentiate between environments by modifying `~/.p10k.zsh`:

```bash
# Production server (red)
typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=196
typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='PROD-Saleem'

# Staging server (yellow)
typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=226
typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='STAGE-Saleem'

# Development server (green)
typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=76
typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='DEV-Saleem'
```

### Add Kubernetes Context to Prompt

Add to left prompt elements in `~/.p10k.zsh`:

```bash
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  context
  dir
  vcs
  kubecontext  # Shows current K8s context
)
```

---

## 🌐 Distribution-Specific Notes

### Ubuntu / Debian / Kali / Parrot
```bash
# Package manager: apt
sudo apt update && sudo apt upgrade -y
sudo apt install zsh git curl -y
```

### CentOS / RHEL / AlmaLinux / Rocky Linux
```bash
# Package manager: yum or dnf
sudo yum update -y  # or: sudo dnf update -y
sudo yum install zsh git curl -y  # or: sudo dnf install zsh git curl -y
```

### Fedora
```bash
# Package manager: dnf
sudo dnf update -y
sudo dnf install zsh git curl -y
```

### Arch Linux / Manjaro
```bash
# Package manager: pacman
sudo pacman -Syu
sudo pacman -Sy zsh git curl --noconfirm
```

### openSUSE
```bash
# Package manager: zypper
sudo zypper refresh
sudo zypper install -y zsh git curl
```

### Alpine Linux
```bash
# Package manager: apk
apk update
apk add zsh git curl
```

---

## 📖 Additional Resources

### Official Documentation
- [Oh-My-Zsh Wiki](https://github.com/ohmyzsh/ohmyzsh/wiki)
- [Powerlevel10k Documentation](https://github.com/romkatv/powerlevel10k)
- [Zsh Documentation](https://zsh.sourceforge.io/Doc/)

### Recommended Nerd Fonts
- [MesloLGS NF](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k) (Recommended)
- [Hack Nerd Font](https://www.nerdfonts.com/)
- [JetBrains Mono Nerd Font](https://www.nerdfonts.com/)
- [Fira Code Nerd Font](https://www.nerdfonts.com/)

### Plugin Directory
- [Awesome Zsh Plugins](https://github.com/unixorn/awesome-zsh-plugins)
- [Oh-My-Zsh Plugins List](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins)

---

## 🤝 Contributing

Found an issue? Have a suggestion? Contributions are welcome!

1. Fork this repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**Saleem Ali**
- 🎓 AIOps Student at Al-Nafi International College
- 💼 LinkedIn: [linkedin.com/in/saleem-ali-189719325](https://www.linkedin.com/in/saleem-ali-189719325/)
- 🐱 GitHub: [github.com/ali4210](https://github.com/ali4210)

---

## ⭐ Show Your Support

If this project helped you, please consider:
- ⭐ Starring this repository
- 🔄 Sharing it with others
- 💬 Providing feedback

---

## 📞 Support

Having issues? Here's how to get help:

1. **Check the Troubleshooting section** above
2. **Search existing issues** on GitHub
3. **Open a new issue** with details:
   - Your Linux distribution and version
   - Error messages (if any)
   - Steps you've already tried

---

## 🎉 Acknowledgments

- [Oh-My-Zsh Team](https://github.com/ohmyzsh/ohmyzsh) - Amazing framework
- [Roman Perepelitsa](https://github.com/romkatv) - Creator of Powerlevel10k
- [Zsh Community](https://www.zsh.org/) - Powerful shell
- All plugin developers - Making Zsh even better

---

## 📊 Statistics

![GitHub stars](https://img.shields.io/github/stars/ali4210/your-repo-name?style=social)
![GitHub forks](https://img.shields.io/github/forks/ali4210/your-repo-name?style=social)
![GitHub watchers](https://img.shields.io/github/watchers/ali4210/your-repo-name?style=social)

---

**Made with ❤️ for the Linux community**

*Last updated: December 12, 2025*
