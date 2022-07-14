.PHONY: clean build docs help
.DEFAULT_GOAL := help

define PRINT_HELP_PYSCRIPT
import re, sys

for line in sys.stdin:
	match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
	if match:
		target, help = match.groups()
		print("%-20s %s" % (target, help))
endef
export PRINT_HELP_PYSCRIPT

help:
	@python -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

clean:  ## remove all build, testing, and static documentation files
	rm -fr build/
	rm -fr dist/
	rm -fr .eggs/
	find . -name '*.egg-info' -exec rm -fr {} +
	find . -name '*.egg' -exec rm -f {} +
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +
	find . -name '.ipynb_checkpoints' -exec rm -fr {} +
	rm -fr .tox/
	rm -fr .coverage
	rm -fr coverage.xml
	rm -fr coverage.json
	rm -fr htmlcov/
	rm -fr .pytest_cache
	rm -fr .mypy_cache
	rm -fr site

test: ## run the tests
	pytest

lint: ## run the linting tools
	pre-commit run --all-files
	flake8 src --count --show-source --statistics
	pylint src -ry
	mypy src

check: ## run the tests and linting tools
	make test
	make lint

build: ## build the docker image
	docker build . -t pytemplates_typer_cli

gen-docs: ## generate HTML documentation
	mkdocs build

docs: ## generate HTML documentation and serve it to the browser
	mkdocs build
	mkdocs serve

pre-release: ## bump the version and create the release tag
	make check
	make gen-docs
	make clean
	bump2version $(increment)
	git describe --tags --abbrev=0
	head pyproject.toml | grep version
	cat src/pytemplates_typer_cli/__version__.py
