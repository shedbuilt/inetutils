#!/bin/bash
./configure --prefix=/usr        \
            --localstatedir=/var \
            --disable-logger     \
            --disable-whois      \
            --disable-rcp        \
            --disable-rexec      \
            --disable-rlogin     \
            --disable-rsh        \
            --disable-servers
make -j $SHED_NUMJOBS
make DESTDIR=${SHED_FAKEROOT} install
mkdir -v ${SHED_FAKEROOT}/bin
mv -v ${SHED_FAKEROOT}/usr/bin/{hostname,ping,ping6,traceroute} ${SHED_FAKEROOT}/bin
mkdir -v ${SHED_FAKEROOT}/sbin
mv -v ${SHED_FAKEROOT}/usr/bin/ifconfig ${SHED_FAKEROOT}/sbin
