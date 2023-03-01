#!/bin/env bash

venv_path="${VENV_GLOBAL_PATH:-$HOME/.local/share/venv}"

venv=$( \
  find "${venv_path}" -mindepth 1 -maxdepth 1 -type d | \
  sed -e "s,${venv_path}/,," | \
  fzf --preview="${venv_path}/{}/bin/pip list")

# No venv selected
if [[ -z "${venv}" ]]; then
  unset venv_path venv
  return 1
fi

source "${venv_path}/${venv}/bin/activate"
unset venv_path venv
