<p align="center">
  <a href="https://user-images.githubusercontent.com/20674972/178172752-abd4497d-6a0e-416b-9eef-1b1c0dca8477.png">
    <img src="https://user-images.githubusercontent.com/20674972/178172752-abd4497d-6a0e-416b-9eef-1b1c0dca8477.png" alt="Pytemplates Banner" style="width:100%;">
  </a>
</p>

<p align="center">
  <a href="https://github.com/PyTemplate/typer_cli/actions/workflows/test.yaml">
    <img src="https://github.com/PyTemplate/typer_cli/actions/workflows/test.yaml/badge.svg" alt="Test status">
  </a>

  <a href="https://github.com/PyTemplate/typer_cli/actions/workflows/lint.yaml">
    <img src="https://github.com/PyTemplate/typer_cli/actions/workflows/lint.yaml/badge.svg" alt="Linting status">
  </a>

  <!-- <a href="https://github.com/PyTemplate/typer_cli/actions/workflows/release.yaml">
    <img src="https://github.com/PyTemplate/typer_cli/actions/workflows/release.yaml/badge.svg" alt="Release status">
  </a> -->

  <a href="https://results.pre-commit.ci/latest/github/PyTemplate/typer_cli/main">
    <img src="https://results.pre-commit.ci/badge/github/PyTemplate/typer_cli/main.svg" alt="pre-commit.ci status">
  </a>

  <a href="https://codecov.io/gh/PyTemplate/typer_cli">
    <img src="https://codecov.io/gh/PyTemplate/typer_cli/branch/main/graph/badge.svg?token=HG1NQ8HRA4" alt="Code coverage status">
  </a>

  <a href="https://pypi.org/project/pytemplates-typer-cli/">
    <img src="https://badge.fury.io/py/pytemplates_typer_cli.svg" alt="PyPI version">
  </a>
</p>

## Description

### A production ready python CLI template

- Metadata and dependency information is stored in the pyproject.toml for compatibility with both [pip](https://pip.pypa.io/en/stable/) and [poetry](https://python-poetry.org/docs/).
- [Flake8](https://flake8.pycqa.org/en/latest/), [pylint](https://pylint.pycqa.org/en/latest/index.html), and [isort](https://pycqa.github.io/isort/) configurations are defined to be compatible with the [black](https://black.readthedocs.io/en/stable/) autoformatter.
- Pylint settings are based on the [Google Python Style Guide](https://google.github.io/styleguide/pyguide.html) and adapted for black compatibility.
- Linting tools run automatically before each commit using [pre-commit](https://pre-commit.com/), black, and isort.
- Test coverage reports are generated during every commit and pull request using [coverage](https://coverage.readthedocs.io/en/6.4.1/) and [pytest-cov](https://pytest-cov.readthedocs.io/en/latest/). All reports are automatically uploaded and archived on [codecov.io](https://about.codecov.io/).
- Unit tests are written using [pytest](https://docs.pytest.org/en/latest/) and static type checking is provided by [mypy](http://mypy-lang.org/index.html).
- Package releases to [PyPI](https://pypi.org/) with dynamic versioning provided by [bump2version](https://github.com/c4urself/bump2version) begin automatically whenever a new tag is created in github.
- Docker images are automatically published to [Docker Hub](https://hub.docker.com/) during every release. Images are tagged with a semantic version number which agrees with the git tag and the PyPI version number.
- Documentation is built using [mkdocs](https://www.mkdocs.org/) and [mkdocstrings](https://mkdocstrings.github.io/). Docs are automatically deployed to [github pages](https://docs.github.com/en/pages) during every release.
- Release notes are automatically generated during every release using [github actions](https://docs.github.com/en/actions).

### [Full Documentation](https://pytemplate.github.io/typer_cli/)

## Installation

To install the package using `pip`:

```bash
pip install pytemplates_typer_cli
```

To download the CLI application using `docker`:

```bash
docker pull pytemplates/typer_cli:latest
```

## Usage

Using the python package installation:

```bash
pytemplates hello user
pytemplates goodbye user
pytemplates version
```

Using the docker image:

```bash
docker run --rm pytemplates/typer_cli hello user
docker run --rm pytemplates/typer_cli goodbye user
docker run --rm pytemplates/typer_cli version
```

## Developer Setup

To begin local development, clone the [PyTemplates/typer_cli](https://github.com/PyTemplate/typer_cli) repository and use one of the following methods to build it. Commands should be executed from inside of the project home folder.

### Using poetry

```bash
poetry install
```

Install optional dependencies using the `--extras` flag:

```bash
poetry install --extras=environment
```

### Using pip

```bash
pip install .
```

Install optional dependencies using square brackets:

```bash
pip install .[environment]
```

### Environments

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
    "mkdocs",
    "mkdocstrings",
    "mkdocstrings-python",
    "mkdocs-material",
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
    "mkdocs",
    "mkdocstrings",
    "mkdocstrings-python",
    "mkdocs-material",
    "bump2version",
]
```

### Using a local docker build

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

## Commands

- `make clean` - Remove all build, testing, and static documentation files.

- `make test` - Run the tests using pytest.

- `make lint` - Run the linting tools. Includes pre-commit hooks, black, isort, flake8, pylint, and mypy.

- `make check` - Run the test and lint commands.

- `make build` - Build a docker image locally using the Dockerfile. The image will be named *pytemplates_typer_cli*.

- `make gen-docs` - Generate HTML documentation.

- `make docs` - Generate HTML documentation and serve it to the browser.

- `make pre-release increment={major/minor/patch}` - Bump the version and create a release tag. Should only be run from the *main* branch. Passes the increment value to bump2version to create a new version number dynamically. The new version number will be added to *\__version__.py* and *pyproject.toml* and a new commit will be logged. The tag will be created from the new commit.

## Workflows

- `test` - Run the tests on every push/pull_request to the *main* branch. Writes a coverage report using pytest-cov and uploads it to codecov.io. Tests run against python versions 3.8 and 3.9. Optional manual trigger in the github actions tab.

- `lint` - Run the linting tools on every push/pull_request to the *main* branch. Includes pre-commit hooks, black, isort, flake8, pylint, and mypy. Optional manual trigger in the github actions tab.

- `docs` - Build the documentation, publish to the *docs* branch, and release to github pages. Runs on a manual trigger in the github actions tab.

- `docker` - Build the docker image, tag it with the branch name, and publish it to dockerhub. Runs on a manual trigger in the github actions tab.

- `release` - Build a wheel distribution, build a docker image, create a github release, and publish to PyPI and Docker Hub whenever a new tag is created. Linting and testing steps must pass before the release steps can begin. Documentation is automatically published to the *docs* branch and hosted on github pages. All github release tags, docker image tags, and PyPI version numbers are in agreement with one another and follow semantic versioning standrads.

## Releases

A release should consist of the following two steps from a tested, linted, and up to date copy of the *main* branch:

1. `make pre-release increment={major/minor/patch}` - Commit the version bump and create a new tag locally. The version number follows semantic versioning standards (major.minor.patch) and the tag is the version number prepended with a 'v'.

2. `git push --follow-tags` - Update the *main* branch with only the changes from the version bump. Publish the new tag and kick off the release workflow.

## File Tree

```bash
.
├── Dockerfile
├── docs
│   ├── app_reference
│   │   └── app.md
│   ├── code_reference
│   │   ├── module1.md
│   │   └── module2.md
│   ├── developer_guide
│   │   ├── commands.md
│   │   ├── developer_setup.md
│   │   ├── releases.md
│   │   └── workflows.md
│   ├── extras
│   │   ├── credits.md
│   │   └── file_tree.md
│   ├── index.md
│   └── user_guide
│       ├── installation.md
│       └── usage.md
├── LICENSE
├── Makefile
├── mkdocs.yml
├── poetry.lock
├── pyproject.toml
├── README.md
├── src
│   └── pytemplates_typer_cli
│       ├── core
│       │   ├── __init__.py
│       │   ├── module1.py
│       │   └── module2.py
│       ├── __init__.py
│       ├── main.py
│       └── __version__.py
└── tests
    ├── __init__.py
    ├── test_app.py
    ├── test_module1.py
    └── test_module2.py
```

## Credits

### Other python package templates

- [https://github.com/waynerv/cookiecutter-pypackage](https://github.com/waynerv/cookiecutter-pypackage)
- [https://github.com/AllenCellModeling/cookiecutter-pypackage](https://github.com/AllenCellModeling/cookiecutter-pypackage)

### Actions

- [https://github.com/JamesIves/github-pages-deploy-action](https://github.com/JamesIves/github-pages-deploy-action)
- [https://github.com/softprops/action-gh-release](https://github.com/softprops/action-gh-release)
