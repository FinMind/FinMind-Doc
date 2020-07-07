import os
import requests

TOKEN = os.environ.get("GITLAB_API_TOEKN", "")
RELEASE_URL = "https://gitlab.com/api/v4/projects/19221467/releases"
res = requests.get(RELEASE_URL, headers={"PRIVATE-TOKEN": TOKEN})
releases = res.json()
contents = [
    f"""## version: {release["tag_name"]} ({release["released_at"][:10]})

{release["description"]}

:octocat: commit_id: {release["commit"]["short_id"]}

:zap: release_at: {release["released_at"].replace("T", " ").replace("Z", "")}

"""
    for release in releases
]

content = f"""{("").join(contents[:15])}"""
with open("docs/release.md", "w", encoding="utf8") as f:
    f.write(content)
