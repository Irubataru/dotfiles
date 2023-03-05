#/bin/env bash
#
# A smart venv selector.

set -o pipefail -o noclobber

script_name="venv"

# Check if we are already in an active venv
function _already_venv() {
  if [[ -n "${VIRTUAL_ENV}" ]]; then
    return 1
  fi
  return 0
}

# Find a local venv if any. Returns 0 if there is no local venv, 1 otherwise.
# It also echos the location of the venv, or where a venv could be created.
function _find_local_venv() {
  git -C . rev-parse &> /dev/null

  if [[ $? == 0 ]]; then
    root_dir=$(git rev-parse --show-toplevel)

    if [[ -d "${root_dir}/.venv" ]]; then
      echo "${root_dir}"
      return 1
    fi

    echo "${root_dir}"
    return 0
  fi

  if [[ -d "${PWD}/.venv" ]]; then
    echo "${PWD}"
    return 1
  fi

  echo "${PWD}"
  return 0
}

# Delete a local venv
function _delete_local_venv() {
  delete_name=$1

  if [[ "$delete_name" != "" ]]; then
    echo "You passed a venv name to --local --delete which doesn't make sense as they are always called .venv"
    return 1
  fi

  venv_path=$(_find_local_venv)
  has_local_venv=$?

  if [[ ${has_local_venv} == 0 ]]; then
    echo "There is no local venv to activate"
    return 1
  fi

  rm -r "${venv_path}/.venv"
  return 0
}


# Handle the case where the --local flag has been set, i.e. specifically work
# with local venvs only
function _handle_local_venv() {
  create_new=$1
  new_name=$2

  # A local venv cannot have a name
  if [[ "$2" != "" ]]; then
    echo "You passed a venv name to --local which doesn't make sense as they are always called .venv"
    return 1
  fi

  venv_path=$(_find_local_venv)
  has_local_venv=$?

  if [[ ${create_new} == 0 ]]; then
    if [[ ${has_local_venv} == 0 ]]; then
      echo "There is no local venv to activate"
      return 1
    fi

    echo "${venv_path}/.venv/bin/activate"
    return 0
  fi

  if [[ ${has_local_venv} == 1 ]]; then
    echo "You cannot create a local venv when one already exists"
    return 1
  fi

  python -m venv "${venv_path}/.venv"
  echo "${venv_path}/.venv/bin/activate"
  return 0
}

# Delete a global venv
function _delete_global_venv() {
  venv_name=$1

  if [[ "$venv_name" == "" ]]; then
    echo "You need to specify a venv to delete"
    return 1
  fi

  venv_path="${VENV_GLOBAL_PATH:-$HOME/.local/share/venv}"

  if [[ ! -d "${venv_path}/${venv_name}" ]]; then
    echo "No venv named ${venv_name} exists"
    return 1
  fi

  rm -r "${venv_path}/${venv_name}"
  return 0
}

# Handle the case where the --global flag has been set, i.e. specifically work
# with global venvs only
function _handle_global_venv() {
  create_new=$1
  venv_name=$2

  venv_path="${VENV_GLOBAL_PATH:-$HOME/.local/share/venv}"

  if [[ ${create_new} == 0 ]]; then

    if [[ "${venv_name}" == "" ]]; then
      venv_name=$( \
        find "${venv_path}" -mindepth 1 -maxdepth 1 -type d | \
        sed -e "s,${venv_path}/,," | \
        fzf --preview="${venv_path}/{}/bin/pip list")
    fi

    if [[ "${venv_name}" == "" ]]; then
      return 1
    fi

    if [[ ! -d "${venv_path}/${venv_name}" ]]; then
      echo "No venv named ${venv_name} exists"
      return 1
    fi

    echo "${venv_path}/${venv_name}/bin/activate"
    return 0

  fi

  if [[ "${venv_name}" == "" ]]; then
    echo "No name provided for the new venv"
    return 1
  fi

  if [[ -d "${venv_path}/${venv_name}" ]]; then
    echo "A venv with name ${venv_name} already exists"
    return 1
  fi

  if [[ -d "${venv_path}" ]]; then
    mkdir -p "${venv_path}"
  fi

  python -m venv "${venv_path}/${venv_name}"
  echo "${venv_path}/${venv_name}/bin/activate"
  return 0
}

# Handle the case where no info about local/global has been specified, and try
# to do the right thing.
function _handle_unspecified_venv() {
  create_new=$1
  venv_name=$2

  # If we're not creating a venv, and a local venv exist, we want to activate it
  if [[ ${create_new} == 0 ]]; then
    venv_path=$(_find_local_venv)
    has_local_venv=$?

    if [[ ${has_local_venv} == 1 ]]; then
      echo "${venv_path}/.venv/bin/activate"
      return 0
    fi
  fi

  return_string=$(_handle_global_venv $create_new "${venv_name}")
  return_value=$?
  echo "$return_string"
  exit $return_value
}

# Print usage information
function _usage() {
  cat <<-EOF
Usage: venv [options] <name>
  Activate or create a venv

Args:
  name              The name of the venv, only when activating a global venv

Options:
  -l| --local       Activate or create a local venv specifically
  -g| --global      Activate or create a global venv specifically
  -n| --new <name>  Create a new venv with name <name>, if --local is specified,
                    one cannot provide a name for the venv
  --delete <name>   Delete the venv with name <name>, if --local is specified,
                    one cannot provide a name for the venv
  -h| --help        Print (this) usage text

If no options are provided the script will try to do the right thing. If a venv
is already active, it will deactivate it. If you are in a directory where a
local venv exists, or a git repo that has one, then that venv will be
activated. If not you will get a prompt to choose between the available global
venvs.

The location of the global venv can be modified by setting the global
environment variable VENV_GLOBAL_PATH.
EOF
}

# Flags
venv_local=0
venv_global=0
venv_name=""
print_usage=0
dry_run=0
delete_venv=0
deleve_name=""
new_venv=0
new_venv_name=""

# Parse arguments
ARGS=$(getopt --options=h,l,g,n --longoptions=help,local,global,new,delete,dry --name="${script_name}" -- "$@")

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
    -n | --new)
      new_venv=1
      shift

      # Bash doesn't support optional flag args, so we have to do what we can
      if [[ "$1" == "--" ]]; then
        shift
        new_venv_name=("$@")
        break
      fi

      ;;
    --delete)
      delete_venv=1
      shift

      # Bash doesn't support optional flag args, so we have to do what we can
      if [[ "$1" == "--" ]]; then
        shift
        delete_name=("$@")
        break
      fi

      ;;
    --dry)
      # TODO: Implement the dry runs
      dry_run=1
      shift
      ;;
    -h | --help)
      print_usage=1
      shift
      ;;
    --)
      shift

      if (( $# > 0 )); then
        if [[ ${new_venv} == 1 ]]; then
          echo "If you want to pass a venv name to --new it has to be the last argument"
          exit 1
        fi

        if [[ ${delete_venv} == 1 ]]; then
          echo "If you want to pass a venv name to --delete it has to be the last argument"
          exit 1
        fi

        venv_name=("$@")
      fi

      break
      ;;
    *)
      echo "Unknown error"
      exit 3
      ;;
  esac
done

# Check for errors and print usage
if [[ ${print_usage} == 1 ]]; then
  _usage
  exit 0
fi

if [[ ${venv_local} == 1 && ${venv_global} == 1 ]]; then
  echo "Cannot both specify --local and --global at the same time"
  exit 1
fi

if [[ ${delete_venv} == 1 && ${new_venv} == 1 ]]; then
  echo "Options --delete and --new are incompatible"
  exit 1
fi

if (( ${#venv_name[@]} > 1 || ${#new_venv_name[@]} > 1 || ${#delete_name[@]} > 1)); then
  error_msg="Cannot specify more than one venv name, "
  error_msg+="got $((${#venv_name[@]} + ${#new_venv_name[@]} + ${#delete_name[@]} - 2)): "
  error_msg+="${venv_name[@]}${new_venv_name[@]}${delete_name[@]}"
  echo "${error_msg}"
  exit 1
fi

_already_venv
if [[ $? == 1 ]]; then

  if [[ ${delete_venv} == 1 ]]; then
    echo "A venv is already active, deactivate it before running --delete"
    exit 1
  fi

  echo "deactivate"
  exit 0
fi

# Delete an existing venv
if [[ ${delete_venv} == 1 ]]; then

  if [[ ${venv_local} == 1 ]]; then
    return_string=$(_delete_local_venv "${delete_name[0]}")
    return_value=$?
    echo "$return_string"
    exit $return_value
  fi

  return_string=$(_delete_global_venv "${delete_name[0]}")
  return_value=$?
  echo "$return_string"
  exit $return_value

fi

# Activare or create a venv
if [[ ${venv_local} == 1 ]]; then
  return_string=$(_handle_local_venv $new_venv "${venv_name[@]}${new_venv_name[0]}")
  return_value=$?
  echo "$return_string"
  exit $return_value
fi

if [[ ${venv_global} == 1 ]]; then
  return_string=$(_handle_global_venv $new_venv "${venv_name[@]}${new_venv_name[0]}")
  return_value=$?
  echo "$return_string"
  exit $return_value
fi

return_string=$(_handle_unspecified_venv $new_venv "${venv_name[@]}${new_venv_name[0]}")
return_value=$?
echo "$return_string"
exit $return_value
