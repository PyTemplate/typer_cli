import os
import socket

import typer

from pytemplates_typer_cli.core.module1 import greet
from pytemplates_typer_cli.core.module2 import wish_farewell

app = typer.Typer()


@app.command()
def hello(user: str):
    typer.echo(greet(user=user))


@app.command()
def goodbye(user: str):
    typer.echo(wish_farewell(user=user))


@app.command()
def whoami():
    typer.echo(f"Host Name: {socket.gethostname()}")
    typer.echo(f"Host IP: {socket.gethostbyname(socket.gethostname())}")
    typer.echo(f"Process ID: {os.getpid()}")


if __name__ == "__main__":
    app()
