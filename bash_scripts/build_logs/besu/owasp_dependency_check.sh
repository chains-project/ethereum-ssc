# OWASP dependency check report besu-21.10.6
cd ../../../nodes_src/besu-21.10.6
#gradle jar -x test
dependency-check --out dependency-check  --enableExperimental --scan .
mv dependency-check ../../bash_scripts/build_logs/besu