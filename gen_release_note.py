import os
import requests


RELEASE_URL = "https://api.github.com/repos/FinMind/FinMind/releases"
res = requests.get(RELEASE_URL)
releases = res.json()
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
