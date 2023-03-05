#/bin/env bash
#
# Utility script to work with _venv.bash.
# Because we need to source results, I have this in between to make it easier
# to write the main script.

activate=$(_venv.bash "$@")

if [[ $? -ne 0 ]]; then
  if [[ "${activate}" != "" ]]; then
    echo "$activate"
  fi
  return $?
fi

if [[ "${activate}" =~ "^Usage*" ]]; then
  echo "${activate}"
  return 0
fi

if [[ "${activate}" == "deactivate" ]]; then
  deactivate
  return 0
fi

if [[ "${activate}" != "" ]]; then
  source "${activate}"
fi
