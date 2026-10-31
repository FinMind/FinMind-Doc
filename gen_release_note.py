import os
import re
import requests


RELEASE_URL = "https://api.github.com/repos/FinMind/FinMind/releases"
# 英文版說明：tag 有翻譯就用翻譯，沒有就用 GitHub Release 原文
EN_TRANSLATION_FILE = "release_note_en.md"


def load_en_translations():
    with open(EN_TRANSLATION_FILE, encoding="utf8", newline="") as f:
        text = f.read()
    sections = re.split(r"^## version: (\S+)\n\n", text, flags=re.M)
    return {
        tag: body.removesuffix("\n\n")
        for tag, body in zip(sections[1::2], sections[2::2])
    }


def gen_release_note(releases, path, translations=None):
    contents = []
    for release in releases:
        body = release["body"].split("**Full Changelog")[0]
        if translations is not None:
            body = translations.get(release["tag_name"], body)
        contents.append(
            f"""## version: {release["tag_name"]} ({release["published_at"][:10]})

{body}

:zap: release_at: {release["published_at"].replace("T", " ").replace("Z", "")}

"""
        )
    content = f"""{("").join(contents)}"""
    with open(path, "w", encoding="utf8") as f:
        f.write(content)


releases = requests.get(RELEASE_URL).json()
gen_release_note(releases, "docs/release.md")
gen_release_note(releases, "docs/release.en.md", load_en_translations())
