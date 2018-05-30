#!/bin/bash
# Configure
./configure --prefix=/usr        \
            --localstatedir=/var \
            --disable-logger     \
            --disable-whois      \
            --disable-rcp        \
            --disable-rexec      \
            --disable-rlogin     \
            --disable-rsh        \
            --disable-servers &&
# Build and Install
make -j $SHED_NUM_JOBS &&
make DESTDIR="$SHED_FAKE_ROOT" install &&
# Rearrange
mkdir -v "${SHED_FAKE_ROOT}/bin" &&
mv -v "${SHED_FAKE_ROOT}"/usr/bin/{hostname,ping,ping6,traceroute} "${SHED_FAKE_ROOT}/bin" &&
mkdir -v "${SHED_FAKE_ROOT}/sbin" &&
mv -v "${SHED_FAKE_ROOT}/usr/bin/ifconfig" "${SHED_FAKE_ROOT}/sbin"
