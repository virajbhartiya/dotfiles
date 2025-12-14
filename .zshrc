# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme configuration
ZSH_THEME="powerlevel10k/powerlevel10k"

# Update configuration
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 14

# Pre-compute expensive operations
export BREW_PREFIX="/opt/homebrew"
export LLVM_PREFIX="$BREW_PREFIX/opt/llvm"
export HWLOC_PREFIX="$BREW_PREFIX/opt/hwloc"

# Consolidated PATH configuration
typeset -U path  # Ensure PATH only contains unique entries
path=(
  "$BREW_PREFIX/bin"
  "$BREW_PREFIX/opt/ruby/bin"
  "/Applications/Postgres.app/Contents/Versions/16/bin"
  "$HOME/.rvm/bin"
  "$HOME/.pub-cache/bin"
  "$HOME/Library/Python/3.9/bin"
  "/opt/flutter/bin"
  "$LLVM_PREFIX/bin"
  "$HWLOC_PREFIX/bin"
  "$HOME/Library/pnpm"
  "$HOME/.local/bin"
  "$HOME/.codeium/windsurf/bin"
  "$BREW_PREFIX/opt/openjdk@11/bin"
  "$BREW_PREFIX/opt/openjdk@17/bin"
  $path
)

# Plugins (load essential ones first)
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Load oh-my-zsh
autoload -Uz compinit && compinit -i # suppresses the warning
source $ZSH/oh-my-zsh.sh

# Load additional plugins (load after oh-my-zsh for better performance)
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Development environment configurations
export JAVA_HOME="$BREW_PREFIX/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home"
export LLVM_HOME="$LLVM_PREFIX"
export LIBCLANG_PATH="$LLVM_HOME/lib"
export CC="$LLVM_PREFIX/bin/clang"
export CXX="$LLVM_PREFIX/bin/clang++"

# HWLOC configurations
export LIBHWLOC_INCLUDE_PATH="$HWLOC_PREFIX/include"
export C_INCLUDE_PATH="$HWLOC_PREFIX/include:$C_INCLUDE_PATH"
export PKG_CONFIG_PATH="$HWLOC_PREFIX/lib/pkgconfig:$PKG_CONFIG_PATH"
export CGO_LDFLAGS="-L$HWLOC_PREFIX/lib"
export CGO_CFLAGS="-I$HWLOC_PREFIX/include"
export CGO_CPPFLAGS="-I$HWLOC_PREFIX/include"

# NVM configuration (lazy loading)
export NVM_DIR="$HOME/.nvm"

# Source additional configuration files (only if they exist and are readable)
for file in ~/.{path,exports,aliases,functions,extra}; do
  [[ -r "$file" ]] && source "$file"
done

# Load powerlevel10k configuration
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Terraform completion (lazy loading)
function terraform() {
  unfunction "$0"
  autoload -U +X bashcompinit && bashcompinit
  complete -o nospace -C $BREW_PREFIX/bin/terraform terraform
  $0 "$@"
}

# NVM Configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$PATH:/Users/art3mis/go/bin"

# THIS IS TO MAKE CURSOR WORK WITH POWERLEVEL10K
# # 🚫 Block Cursor from injecting shell integration early
if [[ "$TERM_PROGRAM" == "vscode" || "$TERM_PROGRAM" == "Cursor" ]]; then
  export VSCODE_SHELL_INTEGRATION=0
  return
fi


export PATH="/opt/homebrew/Cellar/node/24.4.1/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit


# Added by Antigravity
export PATH="/Users/art3mis/.antigravity/antigravity/bin:$PATH"
export JAVA_HOME=$(/usr/libexec/java_home -v 17)
export JAVA_HOME=$(/usr/libexec/java_home -v 17)
export JAVA_HOME="$(brew --prefix openjdk@17)/libexec/openjdk.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$HOME/.daml/bin:$PATH"
export PATH="$HOME/.dpm/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
