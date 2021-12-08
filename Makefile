install-python-evn:
	sudo apt-get update && \
	sudo apt-get install python3-pip -y && \
	pip3 install mkdocs==1.1.2 &&\
	pip3 install markdown-include==0.6.0 &&\
	pip3 install mkdocs-material==7.1.5 &&\
	pip3 install pymdown-extensions==8.2 &&\
	pip3 install requests==2.25.1

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
