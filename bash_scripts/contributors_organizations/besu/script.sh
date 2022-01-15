
# Get the GitHub API url of each user that contributed to the hyperledger/besu project.
# Store in a txt file the list of URLs for post processing.
{curl -u cesarsotovalero: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 --fail --silent --show-error https://api.github.com/repos/hyperledger/besu/contributors\?per_page\=100\&page\=1\&anon\=true | jq -r '.[].organizations_url' &
curl -u cesarsotovalero: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 --fail --silent --show-error https://api.github.com/repos/hyperledger/besu/contributors\?per_page\=100\&page\=2\&anon\=true | jq -r '.[].organizations_url';} |
grep 'https' > besu_contributors_organizations_url.txt

# Iterate over the list of URLs and append the curl result to a txt file.
for i in $(cat besu_contributors_organizations_url.txt); do
    content="$(curl -u cesarsotovalero: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 -s "$i")"
    echo "$content" >> besu_contributors_organizations_url_data.txt
done

#
cat besu_contributors_organizations_url_data.txt | grep "login" | sort  | uniq -c | sort -nr > besu_contributors_organizations.txt