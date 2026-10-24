import os
import requests


RELEASE_URL = "https://api.github.com/repos/FinMind/FinMind/releases"
releases = []
page = 1
while True:
    res = requests.get(RELEASE_URL, params={"per_page": 100, "page": page})
    res.raise_for_status()
    page_releases = res.json()
    if not page_releases:
        break
    releases.extend(page_releases)
    page += 1
contents = [
    f"""## version: {release["tag_name"]} ({release["published_at"][:10]})

{release["body"].split("**Full Changelog")[0]}

:zap: release_at: {release["published_at"].replace("T", " ").replace("Z", "")}

"""
    for release in releases
]

content = f"""{("").join(contents)}"""
with open("docs/release.md", "w", encoding="utf8") as f:
    f.write(content)
