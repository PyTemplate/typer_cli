FROM python:3.8-slim AS build
RUN apt-get update \
    && apt-get install --no-install-recommends -y \
    curl \
    build-essential

# Install Poetry - respects $POETRY_VERSION & $POETRY_HOME
ENV POETRY_HOME="/opt/poetry" \
    POETRY_VERSION="1.1.13"
RUN curl -sSL https://install.python-poetry.org/ | python

# Add Poetry to the path
ENV PATH="$POETRY_HOME/bin:$PATH"

# Tell poetry to create the virtualenv in /.venv
RUN poetry config virtualenvs.in-project true

# Copy in the config files:
COPY poetry.lock pyproject.toml ./

# Install only dependencies first so they are cached by Docker:
RUN poetry install --no-root --no-dev

# Copy in the source code:
COPY src/ src/
COPY README.md ./

# Install source code into the virtualenv
# Installing with pip since poetry does editable installs by default
SHELL ["/bin/bash", "-c"]
RUN source .venv/bin/activate && pip install --upgrade pip
RUN source .venv/bin/activate && pip install . --no-deps

# Hopefully this will work soon
# RUN poetry install --no-dev --no-editable

# Only keep the virtualenv in the runtime image
FROM python:3.8-slim AS runtime
COPY --from=build .venv .venv
ENV PATH=".venv/bin:$PATH"
ENTRYPOINT ["pytemplates"]
