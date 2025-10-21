# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
plugins=(
    git
    zsh-autosuggestions
    fzf-tab
)

source $ZSH/oh-my-zsh.sh

# Neovim
export PATH="$PATH:/opt/nvim/"

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Editor preferences
export EDITOR=nvim
export VISUAL=nvim

# Path configurations
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:/opt/nvim/"

# XDG for flatpak apps
export XDG_DATA_DIRS="/usr/local/share:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share /usr/bin/rofi"

# Enable fzf completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Fuzzy directory search function
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
export LANG=en_IN.UTF-8
export LC_ALL=en_IN.UTF-8
export LANGUAGE=C
export LC_MESSAGES=C

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
