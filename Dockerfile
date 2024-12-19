FROM debian:12 AS base

# Install UV
COPY --from=ghcr.io/astral-sh/uv:0.5.10 /uv /uvx /bin/

ENV UV_COMPILE_BYTECODE=1 \
    UV_LINK_MODE=copy \
    VIRTUAL_ENV=/opt/venv

ENV UV_PROJECT_ENVIRONMENT=$VIRTUAL_ENV

RUN uv venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install dependencies
RUN --mount=type=cache,target=/root/.cache/uv \
    --mount=type=bind,source=uv.lock,target=uv.lock \
    --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
    uv sync --no-install-project

# Final Package Install
RUN mkdir /pynamic/
WORKDIR /pynamic/

COPY . /pynamic/

RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync
