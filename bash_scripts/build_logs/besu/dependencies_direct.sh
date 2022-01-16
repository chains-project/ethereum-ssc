##### Count direct dependencies, see https://docs.gradle.org/current/userguide/java_plugin.html#sec:java_plugin_and_dependency_management
cd ../../../nodes_src/besu-21.10.6

find . -name "build.gradle" -exec cat {} \; |
grep "implementation \|api \|runtimeOnly\|compileOnly\|testCompileOnly\|testImplementation\|testRuntimeOnly\|compileOnlyApi" |
grep -v "project(" | tr -s ' ' |
sort -u > besu-21.10.6_dependencies_direct.txt;

echo -e "Direct dependencies: $(cat besu-21.10.6_dependencies_direct.txt | wc -l)";

mv besu-21.10.6_dependencies_direct.txt ../../bash_scripts/build_logs/besu




