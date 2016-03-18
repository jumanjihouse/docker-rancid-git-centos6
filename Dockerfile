FROM centos:7

# epel-release is now available in centos-extras (enabled by default)
RUN yum -y install epel-release

# basic dev env
RUN yum -y install \
    bash-completion \
    git \
    make \
    rpmdevtools \
    tar\
    tito \
    yum-utils \
    && yum clean all

# create /rpmbuild tree
RUN rpmdev-setuptree

# download sysconftool srpm from fedora 20 and build for centos
ADD build_sysconftool.sh /tmp/
RUN /tmp/build_sysconftool.sh

# build rancid-git
RUN cd /root && \
    git clone https://github.com/dotwaffle/rancid-git.git && \
    cd rancid-git && \
    git checkout 1112b77780b3a3d888d577518f03f2ccadae44ae -b old_commit && \
    yum-builddep -y rancid-git.spec && \
    tito build --rpm --test

# install rancid-git
RUN yum -y localinstall /tmp/tito/x86_64/rancid-git-*.el7.centos.x86_64.rpm
