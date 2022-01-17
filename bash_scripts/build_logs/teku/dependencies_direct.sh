##### Count direct dependencies, see https://docs.gradle.org/current/userguide/java_plugin.html#sec:java_plugin_and_dependency_management
cd ../../../nodes_src/teku-22.1.0

find . -name "build.gradle" -exec cat {} \; |
grep "implementation \|api \|runtimeOnly\|compileOnly\|testCompileOnly\|testImplementation\|testRuntimeOnly\|compileOnlyApi" |
grep -v "project(" | tr -s ' ' |
sort -u > teku-22.1.0_dependencies_direct.txt;

echo -e "Direct dependencies: $(cat teku-22.1.0_dependencies_direct.txt | wc -l)";

mv teku-22.1.0_dependencies_direct.txt ../../bash_scripts/build_logs/teku




