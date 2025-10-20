# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
    fzf-tab
    )

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Enable fzf completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Fzf search directories
# sd() {
# local start_dir
#     if [ -z "$1" ]; then
#         start_dir="$HOME"
#     else
#         start_dir="$HOME/$1"
#     fi
#
#     # Ensure we switch to the correct directory first
#     cd "$start_dir" || return
#
#     # Find directories within the current directory and use fzf
#     local selected_dir
#     selected_dir=$(find * -type d | tail -n +2 | fzf)  # Exclude the '.' directory and pass to fzf
#
#     # If a directory is selected, change into it
#     if [ -n "$selected_dir" ]; then
#         cd "$selected_dir"
#     fi
# }

sd() {
    local start_dir
    local depth=3  # Set the initial max depth

    if [ -z "$1" ]; then
        start_dir="$HOME"
    else
        start_dir="$HOME/$1"
    fi

    while true; do
        cd "$start_dir" || return

        # Find directories up to the specified depth
        local selected_dir
        selected_dir=$(find * -maxdepth "$depth" -type d ! -path "*/.git*" ! -path "*/node_modules*" | fzf)

        # If no directory is selected, break out of the loop
        if [ -z "$selected_dir" ]; then
            break
        fi

        # Change into the selected directory
        start_dir="$start_dir/$selected_dir"
    done

    # Finally, cd into the selected directory
    cd "$start_dir"
}

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias neofetch="neofetch --source ascii_art.txt"
export PATH=/etc/node/bin:$PATH

# Created by `pipx` on 2023-04-30 06:59:04
export PATH="$PATH:/home/atharva/.local/bin"

export PATH="$PATH:/opt/nvim-linux64/bin"

export PATH=$PATH:/home/atharva/.spicetify
export EDITOR=nvim
export VISUAL=nvim
# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# HADOOP ENVIRONMENT
export HADOOP_HOME=/usr/local/hadoop
export HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop
export HADOOP_MAPRED_HOME=/usr/local/hadoop
export HADOOP_COMMON_HOME=/usr/local/hadoop
export HADOOP_HDFS_HOME=/usr/local/hadoop
export YARN_HOME=/usr/local/hadoop
export PATH=$PATH:/usr/local/hadoop/bin
export PATH=$PATH:/usr/local/hadoop/sbin
# HADOOP NATIVE PATH
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export HADOOP_OPTS="$HADOOP_OPTS -Djava.library.path=$HADOOP_HOME/lib/native"

export HADOOP_CLASSPATH=$($HADOOP_HOME/bin/hadoop classpath)

export LD_LIBRARY_PATH=$HADOOP_HOME/lib/native

export JAVA_HOME=/usr
export PATH=$JAVA_HOME/bin:$PATH

export PATH=$PATH:/usr/local/go/bin

# ROFI Applets
export PATH=$HOME/.config/rofi/scripts:$PATH

export XDG_DATA_DIRS=/usr/share:/usr/local/share:/var/lib/snapd/desktop
# Flatpak
export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:/home/atharva/.local/share/flatpak/exports/share:$XDG_DATA_DIRS"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
