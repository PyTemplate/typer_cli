from typer.testing import CliRunner

from pytemplates_typer_cli import __version__
from pytemplates_typer_cli.main import app

runner = CliRunner()


def test_hello():
    result = runner.invoke(app, ["hello", "Jacob"])
    assert result.exit_code == 0
    assert "Hello Jacob!" in result.stdout


def test_goodbye():
    result = runner.invoke(app, ["goodbye", "Jacob"])
    assert result.exit_code == 0
    assert "Goodbye Jacob!" in result.stdout


def test_version():
    result = runner.invoke(app, ["version"])
    assert result.exit_code == 0
    assert __version__ in result.stdout
