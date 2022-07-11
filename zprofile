# set path for pyenv
ARCH=$(uname -m)
if [[ $ARCH == arm64 ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[$ARCH == x86_64 ]]; then
    export PYENV_ROOT="/usr/local/var/pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
fi

export PYTHONPATH="$HOME/.cache/my_python_package"
export PATH="$HOME/.local/apps:$PATH"
