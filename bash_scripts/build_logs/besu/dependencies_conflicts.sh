# Omitted dependencies due to conflicts in the dependency tree of besu-21.10.6
grep "\---" besu-21.10.6_dependencies_tree.txt |
#grep -v "project " |
#cut -d "-" -f 4-7 |
grep "(\*)" |
#sed 's/->.*$/ /p' |
#sed -E 's/:[0-9]+\.[0-9]+.*$/ /g' |
#sed 's/[[:blank:]]*$//' |
#grep -v "\---" |
sort -u > besu-21.10.6_dependencies_conflicts.txt

echo -e "All dependencies: $(cat besu-21.10.6_dependencies_conflicts.txt | wc -l)";