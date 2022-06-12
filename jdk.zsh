set_java_version() {
	export JAVA_HOME="$(/usr/libexec/java_home -v ${1})"
	export PATH="${JAVA_HOME}/bin:${PATH}"
}

export JAVA11_HOME="$(/usr/libexec/java_home -v 11)"
export JAVA17_HOME="$(/usr/libexec/java_home -v 17)"

set_java_version 17
