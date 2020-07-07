install-python-evn:
	apt-get update && \
	apt-get install python3-pip -y && \
	pip3 install mkdocs &&\
	pip3 install markdown-include &&\
	pip3 install mkdocs-material &&\
	pip3 install pymdown-extensions &&\
	pip3 install requests

deploy-github-page:
	mkdir github_page && cd github_page && git init && \
	git config user.name "sam" && git config user.email "finmind.tw@gmail.com" && \
	git remote add origin https://gitlabci:${GITHUB_TOKEN_FINMIND_DOC}@github.com/FinMind/FinMindDoc.git && \
	git fetch origin && git reset --hard origin/master && \
	rm -r * && \
	cp -r ../site/* . && \
	git add . && git commit -m "${CI_COMMIT_TITLE}" && \
	git push origin master