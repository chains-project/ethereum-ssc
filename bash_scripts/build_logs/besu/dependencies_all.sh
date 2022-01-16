# Dependency tree
grep "\---" besu-21.10.6_dependencies_tree.txt |
#grep -v "project " |
cut -d "-" -f 4-7 |
grep -v "(*)" |
sed 's/->.*$/ /p' |
sed -E 's/:[0-9]+\.[0-9]+.*$/ /g' |
sed 's/[[:blank:]]*$//' |
grep -v "\---" |
sort -u > besu-21.10.6_dependencies_all.txt

echo -e "All dependencies: $(cat besu-21.10.6_dependencies_all.txt | wc -l)";