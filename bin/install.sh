#! /bin/bash

program_dir=terminal-scripts
program_url="https://github.com/Irubataru/terminal-scripts.git"

full_program_dir="bin/${program_dir}"

echo ''
echo "Configuring ${program_dir} ..."
echo ''

if [ ! -d "${full_program_dir}" ]; then
  echo "No ${program_dir} found, cloning ..."
  git clone ${program_url} ${full_program_dir}
	echo ''
else
	echo "Do you want to update the ${program_dir} repository?";
	select updaterepo in "Yes" "No"; do
		case $updaterepo in
			Yes ) cd ${full_program_dir} && git pull; break;;
			No ) break;;
		esac
	done
	echo ''
fi
