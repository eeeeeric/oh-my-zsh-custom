export M2_HOME=/usr/local/Cellar/maven/3.6.0
export MAVEN_OPTS="-Xms512m -Xmx1024m"

# Newer versions of the plugin deprecated the -Ddest parameter. It may have been moved to another parameter name.
downloadArtifact() {
        mvn org.apache.maven.plugins:maven-dependency-plugin:2.10:get "-Dartifact=${1}" "-Ddest=$(pwd)"
}
