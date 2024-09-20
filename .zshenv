# Load Cargo environment
. "$HOME/.cargo/env"

# Extend PATH
export PATH="$PATH:/Users/art3mis/.foundry/bin:/opt/homebrew/bin:/Users/art3mis/go/bin/goimports/bin"

export PATH=$PATH:$(go env GOPATH)/bin


# HWLOC-related flags
export LDFLAGS="-L/usr/local/opt/hwloc/lib"
export CPPFLAGS="-I/usr/local/opt/hwloc/include"

export LIBRARY_PATH=$(brew --prefix hwloc)/lib:$LIBRARY_PATH
export LD_LIBRARY_PATH=$(brew --prefix hwloc)/lib:$LD_LIBRARY_PATH


# Other flags
export CGO_LDFLAGS="-L/usr/local/lib"
