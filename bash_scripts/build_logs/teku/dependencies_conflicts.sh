# Omitted dependencies due to conflicts in the dependency tree of teku-22.1.0
grep "\---" teku-22.1.0_dependencies_tree.txt |
#grep -v "project " |
#cut -d "-" -f 4-7 |
grep "(\*)" |
#sed 's/->.*$/ /p' |
#sed -E 's/:[0-9]+\.[0-9]+.*$/ /g' |
#sed 's/[[:blank:]]*$//' |
#grep -v "\---" |
sort -u > teku-22.1.0_dependencies_conflicts.txt

echo -e "All dependencies: $(cat teku-22.1.0_dependencies_conflicts.txt | wc -l)";