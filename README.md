# Storage Performance Development Kit (SPDK)

[![Linters](https://github.com/opiproject/spdk/actions/workflows/linters.yml/badge.svg)](https://github.com/opiproject/spdk/actions/workflows/linters.yml)
[![Docker](https://github.com/opiproject/spdk/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/opiproject/spdk/actions/workflows/docker-publish.yml)
[![Travis](https://app.travis-ci.com/opiproject/spdk.svg?branch=main)](https://app.travis-ci.com/opiproject/spdk)
[![License](https://img.shields.io/github/license/opiproject/spdk?style=flat-square&color=blue&label=License)](https://github.com/opiproject/spdk/blob/master/LICENSE)
[![Pulls](https://img.shields.io/docker/pulls/opiproject/spdk.svg?logo=docker&style=flat&label=Pulls)](https://hub.docker.com/r/opiproject/spdk)
[![Last Release](https://img.shields.io/github/v/release/opiproject/spdk?label=Latest&style=flat-square&logo=go)](https://github.com/opiproject/spdk/releases)
[![GitHub stars](https://img.shields.io/github/stars/opiproject/spdk.svg?style=flat-square&label=github%20stars)](https://github.com/opiproject/spdk)
[![GitHub Contributors](https://img.shields.io/github/contributors/opiproject/spdk.svg?style=flat-square)](https://github.com/opiproject/spdk/graphs/contributors)

The Storage Performance Development Kit (SPDK) provides a set of tools and libraries for writing high performance, scalable, user-mode storage applications. It achieves high performance by moving all of the necessary drivers into userspace and operating in a polled mode instead of relying on interrupts, which avoids kernel context switches and eliminates interrupt handling overhead.

This project contains Dockerfile for <https://github.com/spdk/spdk>

## I Want To Contribute

This project welcomes contributions and suggestions.  We are happy to have the Community involved via submission of **Issues and Pull Requests** (with substantive content or even just fixes). We are hoping for the documents, test framework, etc. to become a community process with active engagement.  PRs can be reviewed by by any number of people, and a maintainer may accept.

See [CONTRIBUTING](https://github.com/opiproject/opi/blob/main/CONTRIBUTING.md) and [GitHub Basic Process](https://github.com/opiproject/opi/blob/main/doc-github-rules.md) for more details.

## Installation

There are several ways of running spdk.

### Docker

```sh
docker pull opiproject/spdk:<version>
```

You can specify a version like `v22.09` or use `latest` to get the most up-to-date version.

```sh
docker run --rm opiproject/spdk:<version>
```

### Compose

:exclamation: `docker-compose` is deprecated. For details, see [Migrate to Compose V2](https://docs.docker.com/compose/migrate/).

```sh
docker-compose up --build --force-recreate
```

## Test SPDK RPC proxy

See documentation [JSON RPC Proxy](https://spdk.io/doc/jsonrpc_proxy.html)

```text
$ curl -k --user spdkuser:spdkpass -X POST -H "Content-Type: application/json" -d '{"id": 1, "method": "bdev_get_bdevs", "params": {"name": "Malloc0"}}' http://127.0.0.1:9009/
{"jsonrpc":"2.0","id":1,"result":[{"name":"Malloc0","aliases":["f1c5d95a-b235-40af-9e4d-2c0b3320de80"],"product_name":"Malloc disk","block_size":512,"num_blocks":131072,"uuid":"f1c5d95a-b235-40af-9e4d-2c0b3320de80","assigned_rate_limits":{"rw_ios_per_sec":0,"rw_mbytes_per_sec":0,"r_mbytes_per_sec":0,"w_mbytes_per_sec":0},"claimed":false,"zoned":false,"supported_io_types":{"read":true,"write":true,"unmap":true,"write_zeroes":true,"flush":true,"reset":true,"nvme_admin":false,"nvme_io":false},"driver_specific":{}}]}
```
