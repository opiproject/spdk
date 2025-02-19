# SPDX-License-Identifier: Apache-2.0
# Copyright (c) 2022-2023 Dell Inc, or its subsidiaries.

FROM docker.io/library/fedora:37 as build

ARG TAG=v24.05
# Pick an arch that has at least sse 4.2 but does not require newer avx
# See https://gcc.gnu.org/onlinedocs/gcc/x86-Options.html
ARG ARCH=x86-64-v2

RUN dnf install -y git rpm-build diffutils procps-ng pip python3-grpcio python3-grpcio-tools && dnf clean all

RUN git clone https://github.com/spdk/spdk --branch ${TAG} --depth 1 /root/spdk
WORKDIR /root/spdk

RUN git submodule update --init --depth 1 && \
    ./scripts/pkgdep.sh --rdma

RUN DEPS="no" LDFLAGS=" " \
    ./rpmbuild/rpm.sh --target-arch=${ARCH} --without-uring --with-crypto \
    --without-fio --with-raid5f --with-vhost --without-rbd \
    --with-rdma --without-shared --with-iscsi-initiator --without-vtune --with-vfio-user

FROM docker.io/library/fedora:37

RUN dnf install -y hostname && dnf clean all

WORKDIR /root
RUN mkdir -p /root/rpmbuild
COPY --from=build /root/rpmbuild/ /root/rpmbuild/
RUN dnf install -y /root/rpmbuild/rpm/*/*.rpm && dnf clean all
EXPOSE 9009
HEALTHCHECK CMD curl --fail --insecure --user spdkuser:spdkpass -X POST -H 'Content-Type: application/json' -d '{\"id\": 1, \"method\": \"bdev_get_bdevs\"}' http://localhost:9009 || exit 1
CMD ["/usr/libexec/spdk/scripts/rpc_http_proxy.py", "0.0.0.0", "9009", "spdkuser", "spdkpass"]
