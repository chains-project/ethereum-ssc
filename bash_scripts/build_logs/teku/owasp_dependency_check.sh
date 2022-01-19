# OWASP dependency check report teku-22.1.0
cd ../../../nodes_src/teku-22.1.0
#gradle jar -x test
dependency-check --out dependency-check  --enableExperimental --scan .
mv dependency-check ../../bash_scripts/build_logs/teku