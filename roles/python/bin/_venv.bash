#/bin/env bash
# Usage: venv [options]
#   Activate the most relevant venv

print_usage() {
  cat <<-EOF
Usage: venv [options]
  Activates a venv

Options:
  -h| --help     Print (this) usage text

The venv activated is either the one stored in ./.venv or GIT_ROOT/.venv if
they exist. If they don't the user will be prompted to choose one of the
global venvs. For more info see `venv-activate-global`.
EOF
}

# If we are already in a venv, deactivate it
if [[ -n "$VIRTUAL_ENV" ]]; then
  if type "deactivate" > /dev/null; then
    deactivate
    return 0
  fi
fi

git -C . rev-parse &> /dev/null

if [[ $? == 0 ]]; then
  root_dir=$(git rev-parse --show-toplevel)

  if [[ -d "${root_dir}/.venv" ]]; then
    source "${root_dir}/.venv/bin/activate"
    return 0
  fi
fi

if [[ -d "${PWD}/.venv" ]]; then
  source "${PWD}/.venv/bin/activate"
  return 0
fi

source _venv_global_select.bash
