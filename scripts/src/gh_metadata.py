import requests
import argparse
import json
from termcolor import colored, cprint

parser = argparse.ArgumentParser(description='Beacon Client Dependencies scanner')
parser.add_argument('client', metavar='repo/project_name', type=str,
                    help='a beacon client GitHub repository for scanning')
parser.add_argument('file', metavar='filename', type=str,
                    help='output json file')
args = parser.parse_args()
client = args.client
fi = args.file
print(colored("Scanning... " + client, 'blue'))
try:
    response = requests.get("https://api.github.com/repos/" + client, timeout=5)
    response.raise_for_status()
    date = response.headers["date"]
    print(colored("Results, as of date: " + date, "magenta"))
    dictionary = response.json()
    name = dictionary['name']
    print(colored("Beacon client: " + name, "blue"))
    language = dictionary['language']
    print(colored("Written in " + language, "magenta"))
    stars = dictionary['stargazers_count']
    print(colored("It has " + str(stars) + " stars", "magenta"))
    open_issues = dictionary['open_issues_count']
    print(colored("It has " + str(open_issues) + " open issues", "magenta"))
    last_update = dictionary['updated_at']
    print(colored("Last commit at " + last_update, "magenta"))
    f = open(fi + ".json", "w")
    f.write(json.dumps(response.json(), indent=4))
    f.close()
    print("Response written in the " + fi + ".json file")
except requests.exceptions.HTTPError as httperror:
    print(httperror)
except requests.exceptions.ConnectionError as connection:
    print(connection)
except requests.exceptions.Timeout as timeout:
    print(timeout)
except requests.exceptions.RequestException as requestexception:
    print(requestexception)
