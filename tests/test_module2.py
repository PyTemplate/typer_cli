from pytemplates_typer_cli.core.module2 import wish_farewell


def test_wish_farewell():
    goodbye = wish_farewell(user="Jacob")
    assert goodbye == "Goodbye Jacob!"
