#!/bin/bash
#
# requires:
#  bash
#  chroot
#
set -x
set -e

echo "doing execscript.sh: $1"

## root

chroot $1 $SHELL <<'EOS'
rpm -Uvh http://dlc.wakame.axsh.jp.s3-website-us-east-1.amazonaws.com/epel-release
yum install -y libyaml-devel
EOS

## normal user

chroot $1 su - ${devel_user} <<'EOS'
whoami

git clone https://github.com/hansode/ruby-1.9.3-rpm.git /tmp/ruby-1.9.3-rpm
rubyminorver=$(egrep "^%define rubyminorver" /tmp/ruby-1.9.3-rpm/ruby193.spec | awk '{print $3}')

cd
rpmdev-setuptree

cp -f /tmp/ruby-1.9.3-rpm/ruby193.spec ~/rpmbuild/SPECS/ruby193.spec

cd ~/rpmbuild/SOURCES; pwd
wget http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-${rubyminorver}.tar.gz

rpmbuild -bb ~/rpmbuild/SPECS/ruby193.spec
EOS

chroot $1 $SHELL <<EOS
rpm -ivh /home/${devel_user}/rpmbuild/RPMS/*/ruby-1.9.3p*.rpm
gem install bundler --no-rdoc --no-ri
EOS

rsync -avx  ${1}/home/${devel_user}/rpmbuild/RPMS/*/ruby-1.9.3p*.rpm ./.
