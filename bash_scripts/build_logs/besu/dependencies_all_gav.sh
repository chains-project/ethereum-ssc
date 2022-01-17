# Dependency tree besu-21.10.6
grep "\---" besu-21.10.6_dependencies_tree.txt |
grep -v "project " |
cut -d "-" -f 4-7 |
grep -v "(*)" |
#sed 's/->.*$/ /p' |
#sed -E 's/:[0-9]+\.[0-9]+.*$/ /g' |
sed 's/[[:blank:]]*$//' |
grep -v "\---" |
sort -u > besu-21.10.6_dependencies_all_gav.txt

echo -e "All dependencies: $(cat besu-21.10.6_dependencies_all_gav.txt | wc -l)";

# ------------------------------------------------------------------------------------------------

# Dependency tree besu-20.10.4
grep "\---" besu-20.10.4_dependencies_tree.txt |
grep -v "project " |
cut -d "-" -f 4-7 |
grep -v "(*)" |
#sed 's/->.*$/ /p' |
#sed -E 's/:[0-9]+\.[0-9]+.*$/ /g' |
sed 's/[[:blank:]]*$//' |
grep -v "\---" |
sort -u > besu-20.10.4_dependencies_all_gav.txt

echo -e "All dependencies: $(cat besu-20.10.4_dependencies_all_gav.txt | wc -l)";