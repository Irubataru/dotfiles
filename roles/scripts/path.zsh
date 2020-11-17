dir=/home/glesaaen/.dotfiles/roles/scripts/terminal-scripts
source ${dir}/modules.sh

for module in ${SCRIPT_MODULES[@]}; do
  export PATH="${PATH}:${dir}/${module}"
done

export PATH="${PATH}:/home/glesaaen/.usr/bin"
