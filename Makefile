all: lint
lint:
	elm-format --validate *.elm 99problems/
format:
	elm-format --yes *.elm 99problems/
install:
	npm install --global elm elm-format@0.7.0-exp run-elm@2.2.0
	elm-package install
