# Developer Setup

To begin local development, clone this repository and use one of the following methods to build it. Commands should be executed from inside of the project home folder (i.e. the location of this README).

## Using poetry:

```bash
poetry install
```

Install optional dependencies using the `--extras` flag:

```bash
poetry install --extras=environment
```

## Using pip:

```bash
pip install .
```

Install optional dependencies using square brackets:

```bash
pip install .[environment]
```

## Environments

```python
test = [
    "pytest",
    "pytest-cov",
]

lint = [
    "black",
    "isort",
    "flake8",
    "pylint",
    "mypy",
    "pre-commit",
]

docs = [
    "Sphinx",
    "sphinx-rtd-theme",
]

# Includes all optional dependencies
dev = [
    "pytest",
    "pytest-cov",
    "black",
    "isort",
    "flake8",
    "pylint",
    "mypy",
    "pre-commit",
    "Sphinx",
    "sphinx-rtd-theme",
    "bump2version",
]
```

## Using a local docker build:

To build an image locally from the Dockerfile:

```bash
make build
```

To run the image:

```bash
docker run --rm pytemplates_typer_cli hello user
docker run --rm pytemplates_typer_cli goodbye user
docker run --rm pytemplates_typer_cli version
```