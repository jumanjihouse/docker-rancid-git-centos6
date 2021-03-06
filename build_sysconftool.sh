#!/bin/bash
set -ex

srpm="sysconftool-0.17-3.fc23.src.rpm"

cd /tmp/
curl -L -O http://fedora.mirror.lstn.net/releases/23/Everything/source/SRPMS/s/$srpm
rpm -Uvh /tmp/$srpm

spec=$(find / -xdev -name sysconftool.spec)
echo "spec: $spec"
yum-builddep -y $spec
rpmbuild -ba $spec

rpms="$(find / -xdev -regex '.*sysconftool.*noarch.rpm')"
echo "rpms: $rpms"
yum -y localinstall $rpms
