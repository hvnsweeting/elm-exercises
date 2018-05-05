all: lint
lint:
	elm-format --validate *.elm 99problems/
format:
	elm-format --yes *.elm 99problems/
