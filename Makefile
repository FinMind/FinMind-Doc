install-python-evn:
	sudo apt-get update && \
	sudo apt-get install python3-pip -y && \
	pip3 install pipenv && \
	pipenv sync

deploy-github-page:
	mkdir github_page && cd github_page && git init && \
	git config user.name "sam" && git config user.email "finmind.tw@gmail.com" && \
	git remote add origin https://FinMind:${FINMIND_DOC_TOKEN}@github.com/FinMind/FinMind.github.io.git && \
	git fetch origin && git reset --hard origin/master && \
	rm -r * && \
	cp -r ../site/* . && \
	git add . && git commit -m "add: update FinMind doc" && \
	git push origin master

run-dev:
	pipenv run mkdocs serve

install:
	pipenv sync
