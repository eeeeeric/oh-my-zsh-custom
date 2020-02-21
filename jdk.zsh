set_java_version() {
	export JAVA_HOME="$(/usr/libexec/java_home -v ${1})"
	export PATH="${JAVA_HOME}/bin:${PATH}"
}

export JAVA8_HOME="$(/usr/libexec/java_home -v 1.8)"
export JAVA11_HOME="$(/usr/libexec/java_home -v 11)"
export JAVA12_HOME="$(/usr/libexec/java_home -v 12)"

set_java_version 1.8
