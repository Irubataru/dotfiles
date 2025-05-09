#!/bin/env bash

# A smart venv selector

set -o pipefail -o noclobber

script_name="venv"

# Print error message and exit with error code
function _error() {
  local message="$1"
  local exit_code="${2:-1}"
  echo "$message" >&2
  exit "$exit_code"
}

# Check if we are already in an active venv
function _already_venv() {
  if [[ -n "${VIRTUAL_ENV}" ]]; then
    return 1
  fi
  return 0
}

# Find a local venv if any. Returns 0 if there is no local venv, 1 otherwise.
# It also echos the location of the venv.
function _find_local_venv() {
  # Check current directory first
  if [[ -d "${PWD}/.venv" ]]; then
    echo "${PWD}"
    return 1
  fi

  # Check git root if in a git repository
  if git -C . rev-parse &> /dev/null; then
    local root_dir
    root_dir=$(git rev-parse --show-toplevel)

    if [[ -d "${root_dir}/.venv" ]]; then
      echo "${root_dir}"
      return 1
    fi
    
    # TODO: Check every parent dir until git root before git root
  fi

  echo "${PWD}"
  return 0
}

# Get the global venv path
function _get_global_venv_path() {
  echo "${VENV_GLOBAL_PATH:-$HOME/.local/share/venv}"
}

# Handle the case where the --local flag has been set, i.e. specifically work
# with local venvs only
function _handle_local_venv() {
  local venv_path
  venv_path=$(_find_local_venv)
  local has_local_venv=$?

  if [[ ${has_local_venv} == 0 ]]; then
    _error "No local venv found. Use 'uv venv' to create one."
  fi

  echo "${venv_path}/.venv/bin/activate"
  return 0
}

# Handle the case where the --global flag has been set, i.e. specifically work
# with global venvs only
function _handle_global_venv() {
  local venv_name=$1
  local venv_path
  venv_path=$(_get_global_venv_path)

  if [[ -z "${venv_name}" ]]; then
    venv_name=$( \
      find "${venv_path}" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | \
      sed -e "s,${venv_path}/,," | \
      fzf \
        --preview="${venv_path}/{}/bin/pip list"
    )
  fi

  if [[ -z "${venv_name}" ]]; then
    return 1
  fi

  if [[ ! -d "${venv_path}/${venv_name}" ]]; then
    _error "No venv named ${venv_name} exists. Use 'uv venv ${venv_path}/${venv_name}' to create it."
  fi

  echo "${venv_path}/${venv_name}/bin/activate"
  return 0
}

# Handle the case where no info about local/global has been specified, and try
# to do the right thing.
function _handle_unspecified_venv() {
  local venv_name=$1

  # If a local venv exists, we want to activate it
  local venv_path
  venv_path=$(_find_local_venv)
  local has_local_venv=$?

  if [[ ${has_local_venv} == 1 ]]; then
    echo "${venv_path}/.venv/bin/activate"
    return 0
  fi

  # Otherwise, try to activate a global venv
  local return_string
  return_string=$(_handle_global_venv "${venv_name}")
  local return_value=$?
  echo "$return_string"
  return $return_value
}

# Print usage information
function _usage() {
  cat <<-EOF
Usage: venv [options] <name>
  Activate an existing venv

Args:
  name              The name of the venv, only when activating a global venv

Options:
  -l| --local       Activate a local venv specifically
  -g| --global      Activate a global venv specifically
  -h| --help        Print (this) usage text

If no options are provided the script will try to do the right thing. If a venv
is already active, it will deactivate it. If you are in a directory where a
local venv exists, or a git repo that has one, then that venv will be
activated. If not you will get a prompt to choose between the available global
venvs.

To create a new venv, use 'uv venv <path>' directly.

The location of the global venv can be modified by setting the global
environment variable VENV_GLOBAL_PATH.
EOF
}

# Main script execution starts here

# Flags
venv_local=0
venv_global=0
venv_name=""
print_usage=0

# Parse arguments
ARGS=$(getopt --options=h,l,g --longoptions=help,local,global --name="${script_name}" -- "$@")

if [[ $? -ne 0 ]]; then
  _usage
  exit 1
fi

eval set -- "${ARGS}"
while true; do
  case "$1" in
    -l | --local)
      venv_local=1
      shift
      ;;
    -g | --global)
      venv_global=1
      shift
      ;;
    -h | --help)
      print_usage=1
      shift
      ;;
    --)
      shift
      if (( $# > 0 )); then
        venv_name="$1"
        # Ignore additional arguments
        if (( $# > 1 )); then
          echo "Warning: ignoring additional arguments"
        fi
      fi
      break
      ;;
    *)
      _error "Unknown error" 3
      ;;
  esac
done

# Check for errors and print usage
if [[ ${print_usage} == 1 ]]; then
  _usage
  exit 0
fi

if [[ ${venv_local} == 1 && ${venv_global} == 1 ]]; then
  _error "Cannot both specify --local and --global at the same time"
fi

_already_venv
if [[ $? == 1 ]]; then
  echo "deactivate"
  exit 0
fi

# Activate a venv
if [[ ${venv_local} == 1 ]]; then
  return_string=$(_handle_local_venv)
  return_value=$?
  echo "$return_string"
  exit $return_value
fi

if [[ ${venv_global} == 1 ]]; then
  return_string=$(_handle_global_venv "${venv_name}")
  return_value=$?
  echo "$return_string"
  exit $return_value
fi

return_string=$(_handle_unspecified_venv "${venv_name}")
return_value=$?
echo "$return_string"
exit $return_value

