wt() {
	result="$(/home/aleksandra/.local/share/zinit/plugins/mateusauler---git-worktree-switcher/wt "$@")"
	dest_path="$(echo "$result" | awk '/^changedir:.*/ {sub("changedir:", ""); print; exit}')"

	if [[ -n "$dest_path" ]]; then
		cd "$dest_path" || return
	elif [[ -n $result ]]; then
		echo "$result"
	fi
}
