
dev-server:
	hugo server --baseURL=128.110.38.29 --bind=128.110.38.29 --buildDrafts

register-hugo-runner:
	sudo gitlab-runner register --non-interactive --url "http://128.110.22.99/" --registration-token "WeVNwkSM_LccQr6t6YvN" --executor "docker" --docker-image cibuilds/hugo:0.50 --description "hugo" --tag-list "hugo" --run-untagged --locked="false" --docker-pull-policy "if-not-present" 

register-mkdocs-runner:
	sudo gitlab-runner register --non-interactive --url "http://128.110.22.99/" --registration-token "WeVNwkSM_LccQr6t6YvN" --executor "docker" --docker-image squidfunk/mkdocs-material:latest --description "mkdocs" --tag-list "mkdocs" --run-untagged --locked="false" --docker-pull-policy "if-not-present" 

nbslides: 
	python ipy2slides.py

mkdocs-images:
	docker build -t mkdocs .

deploy-github-page:
	mkdir github_page && cd github_page && git init && \
	git config user.name "yvictor" && git config user.email "yvictor3141@gmail.com" && \
	git remote add origin https://gitlabci:${GITHUB_TOKEN}@github.com/Sinotrade/Sinotrade.github.io.git && \
	git fetch origin && git reset --hard origin/master && \
	rm -rf tutorial && \
	cp -r ../site/** . && cp -r ../tutorial . && \
	cp -r ../slides . && cp ../environment.yml . && \
	git add -A && git commit -m "${CI_COMMIT_TITLE}" && \
	git push origin master