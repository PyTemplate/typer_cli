<p align="center">
  <a href="https://user-images.githubusercontent.com/20674972/178172752-abd4497d-6a0e-416b-9eef-1b1c0dca8477.png">
    <img src="https://user-images.githubusercontent.com/20674972/178172752-abd4497d-6a0e-416b-9eef-1b1c0dca8477.png" alt="Pytemplates Banner" style="width:100%;">
  </a>
</p>

<p align="center">
  <a href="https://github.com/PyTemplate/python_package/actions/workflows/test.yaml">
    <img src="https://github.com/PyTemplate/python_package/actions/workflows/test.yaml/badge.svg" alt="Test status">
  </a>

  <a href="https://github.com/PyTemplate/python_package/actions/workflows/lint.yaml">
    <img src="https://github.com/PyTemplate/python_package/actions/workflows/lint.yaml/badge.svg" alt="Linting status">
  </a>

  <!-- <a href="https://github.com/PyTemplate/python_package/actions/workflows/release.yaml">
    <img src="https://github.com/PyTemplate/python_package/actions/workflows/release.yaml/badge.svg" alt="Release status">
  </a> -->

  <a href="https://results.pre-commit.ci/latest/github/PyTemplate/python_package/main">
    <img src="https://results.pre-commit.ci/badge/github/PyTemplate/python_package/main.svg" alt="pre-commit.ci status">
  </a>

  <a href="https://codecov.io/gh/PyTemplate/python_package">
    <img src="https://codecov.io/gh/PyTemplate/python_package/branch/main/graph/badge.svg?token=HG1NQ8HRA4" alt="Code coverage status">
  </a>

  <a href="https://pypi.org/project/pytemplates-pypackage/">
    <img src="https://badge.fury.io/py/pytemplates_pypackage.svg" alt="PyPI version">
  </a>
</p>

## Description

### A production ready python library template

- Metadata and dependency information is stored in the pyproject.toml for compatibility with both [pip](https://pip.pypa.io/en/stable/) and [poetry](https://python-poetry.org/docs/).
- [Flake8](https://flake8.pycqa.org/en/latest/), [pylint](https://pylint.pycqa.org/en/latest/index.html), [isort](https://pycqa.github.io/isort/), and [pytest](https://docs.pytest.org/en/latest/) configurations are defined to be compatible with the [black](https://black.readthedocs.io/en/stable/) autoformatter.
- Pylint settings are based on the [Google Python Style Guide](https://google.github.io/styleguide/pyguide.html) and adapted for black compatibility.
- Linting tools run automatically before each commit using [pre-commit](https://pre-commit.com/), black, and isort.
- Test coverage reports are generated during every commit and pull request using [coverage](https://coverage.readthedocs.io/en/6.4.1/) and [pytest-cov](https://pytest-cov.readthedocs.io/en/latest/). All reports are automatically uploaded and archived on [codecov.io](https://about.codecov.io/).
- Unit tests are written using [pytest](https://docs.pytest.org/en/latest/) and static type checking is provided by [mypy](http://mypy-lang.org/index.html).
- Package releases to [PyPI](https://pypi.org/) with dynamic versioning provided by [bump2version](https://github.com/c4urself/bump2version) begin automatically whenever a new tag is created in github.
- [Sphinx](https://www.sphinx-doc.org/en/master/) documentation is automatically generated and deployed to [github pages](https://docs.github.com/en/pages) during every release.
- Release notes are automatically generated during every release using [github actions](https://docs.github.com/en/actions).

### [Source code documentation](https://pytemplate.github.io/python_package/)

## Installation

To install the package using `pip`:

```bash
pip install pytemplates_pypackage
```

To add the package as a dependency using `poetry`:

```bash
poetry add pytemplates_pypackage
```

## Usage

From a `.py` file:

```python
import pytemplates_pypackage
print(pytemplates_pypackage.__version__)
pytemplates_pypackage.greet(user="Jacob")

from pytemplates_pypackage import wish_farewell
wish_farewell(user="Jacob")
```

## Developer Setup

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

## Commands

- `make clean` - Remove all build, testing, and static documentation files.

- `make test` - Run the tests using pytest.

- `make lint` - Run the linting tools. Includes pre-commit hooks, black, isort, flake8, pylint, and mypy.

- `make check` - Run the test and lint commands, followed by the clean command.

- `make gen-docs` - Generate Sphinx HTML documentation.

- `make docs` - Generate Sphinx HTML documentation and serve it to the browser.

- `make pre-release increment={major/minor/patch}` - Bump the version and create a release tag. Should only be run from the *main* branch. Passes the increment value to bump2version to create a new version number dynamically. The new version number will be added to *\__version__.py* and *pyproject.toml* and a new commit will be logged. The tag will be created from the new commit.

## Workflows

- `test` - Run the tests on every push/pull_request to the *main* branch. Writes a coverage report using pytest-cov and uploads it to codecov.io. Tests run against python versions 3.8 and 3.9. Optional manual trigger in the github actions tab.

- `lint` - Run the linting tools on every push/pull_request to the *main* branch. Includes pre-commit hooks, black, isort, flake8, pylint, and mypy. Optional manual trigger in the github actions tab.

- `docs` - Build the sphinx documentation, publish to the *sphinx-docs* branch, and release to github pages. Runs on a manual trigger in the github actions tab.

- `release` - Build a package distribution, create a github release, and publish the distribution to PyPI whenever a new tag is created. Linting and testing steps must pass before the release steps can begin. Sphinx documentation is automatically published to the *sphinx-docs* branch and hosted on github pages.

## Releases

A release should consist of the following two steps from a tested, linted, and up to date copy of the *main* branch:

1. `make pre-release increment={major/minor/patch}` - Commit the version number bump and create a new tag locally. The version number follows semantic versioning standards (major.minor.patch) and the tag is the version number prepended with a 'v'.

2. `git push --follow-tags` - Update the *main* branch with only the changes from the version bump. Publish the new tag and kick off the release workflow.

## File Tree

```bash
.
├── docs/
├── LICENSE
├── Makefile
├── poetry.lock
├── pyproject.toml
├── README.md
├── src
│   └── pytemplates_pypackage
│       ├── core
│       │   ├── __init__.py
│       │   ├── module1.py
│       │   └── module2.py
│       ├── __init__.py
│       └── __version__.py
└── tests
    ├── __init__.py
    ├── test_module1.py
    └── test_module2.py
```

## Credits

### Other python package templates

- https://github.com/waynerv/cookiecutter-pypackage
- https://github.com/AllenCellModeling/cookiecutter-pypackage

### Actions

- https://github.com/JamesIves/github-pages-deploy-action
- https://github.com/softprops/action-gh-release
