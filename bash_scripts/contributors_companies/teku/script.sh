# Get the GitHub API url of each user that contributed to the hyperledger/teku project.
# Store in a txt file the list of URLs for post processing.
curl -u cesarsotovalero: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 --fail --silent --show-error https://api.github.com/repos/ConsenSys/teku/contributors\?per_page\=100\&page\=1\&anon\=true | jq -r '.[].url'  |
grep 'https' > teku_contributors_urls.txt

# Iterate over the list of URLs and append the curl result to a txt file.
for i in $(cat teku_contributors_urls.txt); do
    content="$(curl -u cesarsotovalero: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 -s "$i")"
    echo "$content" >> teku_contributors_data.txt
done

#
cat teku_contributors_data.txt | grep "company" | sort  | uniq -c | sort -nr > teku_contributors_companies.txt