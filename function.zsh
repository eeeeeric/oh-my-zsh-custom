# Notifications
notify-on-completion() {
	local CMD="${1}"
	"${@}"
	local EXIT_CODE="${?}"
	shift
	terminal-notifier -title "${CMD}" -subtitle "${*}" -message "${CMD} completed with exit code ${EXIT_CODE}"
}

# Java
jkill9() {
	name="${1}"
	jps | grep "${name}" | awk -F' ' '{ print $1 }' | xargs -t -n 1 kill -9
}

# shutils (kind of)
do-until-failure() {
# do-until-failure command arg1 arg2 ...
  exit_code=0
  iterations=0
  until [ $exit_code -ne 0 ]; do
    "${@}"
    exit_code=$?
    let iterations++
    echo "Completed iteration: ${iterations}"
  done

  echo "Executed command '${@}' ${iterations} time(s)"
  terminal-notifier -title "Command '${1}' Failed" -message "Took ${iterations} iteration(s)"  
}

# check for file/directory existence
exists() {
	if [[ -e "$1" ]]; then
		if [[ -f "$1" ]]; then
			echo "$1 exists and is a file"
		elif [[ -d "$1" ]]; then
			echo "$1 exists and is a directory"
		elif [[ -L "$1" ]]; then
			echo "$1 exists and is a symlink"
		fi
		NUM_NAMES=$(gstat -c %h -- "$1")
		[[ "$NUM_NAMES" -gt 1 ]] && echo "$1 has $NUM_NAMES names"
		return 0
	else
		echo "$1 does not exist"
		return 1
	fi
}

# Find what process is using a port
port() {
  lsof -n -i4TCP:"${1}" | grep LISTEN
}

