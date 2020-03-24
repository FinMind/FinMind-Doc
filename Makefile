
deploy-github-page:
	mkdocs build && \
	mkdir github_page && cd github_page && git init && \
	git config user.name "sam" && git config user.email "finmind.tw@gmail.com" && \
	git remote add origin https://gitlabci:1ac15a52102db1e2c70d70b214cb0e4adc34fe3a@github.com/FinMind/FinMindDoc.git && \
	git fetch origin && git reset --hard origin/master && \
	rm -r * && \
	cp -r ../site/* . && \
	git add . && git commit -m "${CI_COMMIT_TITLE}" && \
	git push origin master