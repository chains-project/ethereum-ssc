#!/bin/bash

##### Count direct dependencies
find . -name "build.gradle" -exec cat {} \; | grep "implementation" | grep -v "project(" | tr -s ' ' >output
sort -u output > direct_dependencies.txt;
rm output
echo -e "Direct dependencies: $(cat direct_dependencies.txt | wc -l)";

##### Count all dependencies
gradle -q dependencies | grep "\---" | grep -v "project " | cut -d "-" -f 4-7 | grep -v "(*)" | sed 's/->.*$/ /p' | sed -E 's/:[0-9]+\.[0-9]+.*$/ /g' | sort -u > all_dependencies.txt
echo -e "All dependencies: $(cat all_dependencies.txt | wc -l)";

##### Calculating max degree of dependencies
gradle -q dependencies | sed 's/|/ /g' testfile | awk -F'[^ ]' '{print length($1),NR}' > depth.txt

# max degree is equal to the max gap spaces /5 (because there are 5 gaps for each degree)
# + 1 (as the 1st degree there is no gap)
echo -e "Dependencies max degree: $(expr $(cat depth.txt | sort -nr | head -1 | cut -d " " -f 1) / 5 + 1)";