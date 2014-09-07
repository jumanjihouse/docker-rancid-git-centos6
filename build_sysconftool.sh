#!/bin/bash
set -e

srpm="sysconftool-0.17-1.fc20.src.rpm"

cd /tmp/
curl -L -O http://fedora.mirror.lstn.net/releases/20/Everything/source/SRPMS/s/$srpm
rpm -Uvh /tmp/$srpm

spec=$(find / -name sysconftool.spec)
echo "spec: $spec"
yum-builddep -y $spec
rpmbuild -ba $spec

rpms="$(find / -regex '.*sysconftool.*noarch.rpm')"
echo "rpms: $rpms"
yum -y localinstall $rpms
