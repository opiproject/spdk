# SPDX-License-Identifier: Apache-2.0
# Copyright (c) 2022 Dell Inc, or its subsidiaries.

FROM docker.io/library/python:3.11.2-slim

RUN apt-get update && apt-get install -y --no-install-recommends gettext libsqlite3-dev curl gcc && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir --requirement /tmp/requirements.txt

ENTRYPOINT ["sztpd"]
CMD ["sqlite:///:memory:"]
HEALTHCHECK CMD curl --fail -H Accept:application/yang-data+json http://127.0.0.1:8080/.well-known/host-meta || exit 1
