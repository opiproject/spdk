# Secure Zero Touch Provisioning (sZTP)

[![Linters](https://github.com/opiproject/sztpd/actions/workflows/linters.yml/badge.svg)](https://github.com/opiproject/sztpd/actions/workflows/linters.yml)
[![Docker](https://github.com/opiproject/sztpd/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/opiproject/sztpd/actions/workflows/docker-publish.yml)
[![License](https://img.shields.io/github/license/opiproject/sztpd?style=flat-square&color=blue&label=License)](https://github.com/opiproject/sztpd/blob/master/LICENSE)
[![Pulls](https://img.shields.io/docker/pulls/opiproject/sztpd.svg?logo=docker&style=flat&label=Pulls)](https://hub.docker.com/r/opiproject/sztpd)
[![Last Release](https://img.shields.io/github/v/release/opiproject/sztpd?label=Latest&style=flat-square&logo=go)](https://github.com/opiproject/sztpd/releases)

SZTPD implements the [Bootstrap Server](https://tools.ietf.org/html/rfc8572#section-4.4) defined in [RFC 8572: Secure Zero Touch Provisioning (SZTP)](https://tools.ietf.org/html/rfc8572).

This project contains Dockerfile for <https://pypi.org/project/sztpd>

## I Want To Contribute

This project welcomes contributions and suggestions.  We are happy to have the Community involved via submission of **Issues and Pull Requests** (with substantive content or even just fixes). We are hoping for the documents, test framework, etc. to become a community process with active engagement.  PRs can be reviewed by by any number of people, and a maintainer may accept.

See [CONTRIBUTING](https://github.com/opiproject/opi/blob/main/CONTRIBUTING.md) and [GitHub Basic Process](https://github.com/opiproject/opi/blob/main/doc-github-rules.md) for more details.

## Installation

There are several ways of running sztpd.

### Docker

```sh
docker pull opiproject/sztpd:<version>
```

You can specify a version like `0.0.11` or use `latest` to get the most up-to-date version.

```sh
docker run --rm -e SZTPD_INIT_MODE=1 -e SZTPD_ACCEPT_CONTRACT=Yes -e SZTPD_INIT_PORT=8080 -e SZTPD_INIT_ADDR=127.0.0.1 opiproject/sztpd:<version>
```

### PyPI

```sh
pip install sztpd==0.0.11
```
