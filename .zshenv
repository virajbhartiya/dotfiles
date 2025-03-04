# Essential environment variables
export GOPATH=$HOME/go

# Pre-computed brew prefix paths (faster than running brew --prefix)
export HWLOC_PREFIX="/opt/homebrew/opt/hwloc"
export LIBRARY_PATH="$HWLOC_PREFIX/lib:$LIBRARY_PATH"
export LD_LIBRARY_PATH="$HWLOC_PREFIX/lib:$LD_LIBRARY_PATH"

# Load Cargo environment if it exists
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# Consolidated PATH additions
export PATH="$PATH:/Users/art3mis/.foundry/bin:/opt/homebrew/bin:/Users/art3mis/go/bin/goimports/bin"

# HWLOC-related flags
export LDFLAGS="-L/usr/local/opt/hwloc/lib"
export CPPFLAGS="-I/usr/local/opt/hwloc/include"

# Other flags
# export CGO_LDFLAGS="-L/usr/local/lib"
# export PATH=$PATH:~/.cargo/bin/
