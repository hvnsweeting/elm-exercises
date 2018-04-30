all: lint
lint:
	elm-format --validate *.elm
format:
	elm-format --yes *.elm
