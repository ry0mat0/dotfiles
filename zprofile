# set path for pyenv
export PYENV_ROOT="/usr/local/var/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

export PYTHONPATH="$HOME/.cache/my_python_package"
export PATH="$HOME/.local/apps:$PATH"
