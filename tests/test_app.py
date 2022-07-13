from typer.testing import CliRunner

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


def test_whoami():
    result = runner.invoke(app, ["whoami"])
    assert result.exit_code == 0
    assert "Host Name" in result.stdout
    assert "Host IP" in result.stdout
    assert "Process ID" in result.stdout
