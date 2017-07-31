dir=${DOTFILES}/bin/terminal-scripts
source ${dir}/modules.sh

for module in ${SCRIPT_MODULES[@]}; do
  export PATH="${PATH}:${dir}/${module}"
done
