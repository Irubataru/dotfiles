#!/bin/env bash
# Usage: venv-create-global [options] environment_name

print_usage() {
  cat <<-EOF
Usage: venv-create-global [options] environment_name
  Creates a python venv in the global registry

Options:
  -h| --help     Print (this) usage text

The global venvs are stored by default in #HOME/.local/share/venv, this can be
overwritten with the VENV_GLOBAL_PATH environment variable.
EOF
}

if [[ -z "$1" ]]; then
  printf "No environment name provided\n"
  print_usage
  return 1
fi

venv_path="${VENV_GLOBAL_PATH:-$HOME/.local/share/venv}"

if [[ -d "${venv_path}/$1" ]]; then
  printf "Environment already exists\n";
  return 1
fi

python -m venv "${venv_path}/$1"
source "${venv_path}/$1/bin/activate"
