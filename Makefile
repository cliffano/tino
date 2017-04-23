ci: lint

init:
	docker pull mecab/siggraph2016_colorization

lint:
	shellcheck *.sh
