# Dependency tree teku-22.1.0
grep "\---" teku-22.1.0_dependencies_tree.txt |
#grep -v "project " |
cut -d "-" -f 4-7 |
grep -v "(*)" |
sed 's/->.*$/ /p' |
sed -E 's/:[0-9]+\.[0-9]+.*$/ /g' |
sed 's/[[:blank:]]*$//' |
grep -v "\---" |
sort -u > teku-22.1.0_dependencies_all.txt

echo -e "All dependencies: $(cat teku-22.1.0_dependencies_all.txt | wc -l)";

# ------------------------------------------------------------------------------------------------

# Dependency tree teku-21.1.0
grep "\---" teku-21.1.0_dependencies_tree.txt |
#grep -v "project " |
cut -d "-" -f 4-7 |
grep -v "(*)" |
sed 's/->.*$/ /p' |
sed -E 's/:[0-9]+\.[0-9]+.*$/ /g' |
sed 's/[[:blank:]]*$//' |
grep -v "\---" |
sort -u > teku-21.1.0_dependencies_all.txt

echo -e "All dependencies: $(cat teku-21.1.0_dependencies_all.txt | wc -l)";