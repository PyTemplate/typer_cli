from pytemplates_pypackage.core.module1 import greet


def test_greet():
    hello = greet(user="Jacob")
    assert hello == "Hello Jacob!"
