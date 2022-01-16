# Dependency tree
cd ../../../nodes_src/besu-21.10.6

# A shell alias to display the dependency tree of all the Gradle submodules
alias gradle-all-deps='gradle -q dependencies $(gradle -q projects \
    | grep -Fe ---\ Project \
    | sed -Ee "s/^.+--- Project '"'([^']+)'/\1:dependencies/"'")'

gradle-all-deps > besu-21.10.6_dependencies_tree.txt

mv besu-21.10.6_dependencies_tree.txt ../../bash_scripts/build_logs/besu