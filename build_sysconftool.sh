#!/bin/bash
set -e

cd /tmp/
curl -L -O http://fedora.mirror.lstn.net//releases/20/Everything/source/SRPMS/s/sysconftool-0.17-1.fc20.src.rpm
rpm -Uvh sysconftool-*.rpm
yum-builddep -y /rpmbuild/SPECS/sysconftool.spec
rpmbuild -ba /rpmbuild/SPECS/sysconftool.spec
yum -y localinstall /rpmbuild/RPMS/noarch/sysconftool-*.rpm
