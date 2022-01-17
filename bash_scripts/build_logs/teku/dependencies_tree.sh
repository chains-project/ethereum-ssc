# Dependency tree teku-22.1.0
cd ../../../nodes_src/teku-22.1.0

# A shell alias to display the dependency tree of all the Gradle submodules
alias gradle-all-deps='gradle -q dependencies $(gradle -q projects \
    | grep -Fe ---\ Project \
    | sed -Ee "s/^.+--- Project '"'([^']+)'/\1:dependencies/"'")'

gradle-all-deps > teku-22.1.0_dependencies_tree.txt
mv teku-22.1.0_dependencies_tree.txt ../../bash_scripts/build_logs/teku

# Dependency tree teku-21.1.0
export JAVA_HOME=`/usr/libexec/java_home -v 1.8` # only works with java < v8

cd ../../bash_scripts/build_logs/teku
cd ../../../nodes_src/teku-21.1.0
gradle-all-deps > teku-21.1.0_dependencies_tree.txt
mv teku-21.1.0_dependencies_tree.txt ../../bash_scripts/build_logs/teku