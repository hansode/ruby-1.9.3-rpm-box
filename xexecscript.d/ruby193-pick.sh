#!/bin/bash
#
# requires:
#  bash
#  chroot
#
set -x
set -e

echo "doing execscript.sh: $1"

rsync -avx  ${1}/home/${devel_user}/rpmbuild/RPMS/*/ruby-1.9.3p*.rpm ./.
bash -c 'chown -R ${SUDO_UID}:${SUDO_GID} ruby-1.9.3p*.rpm'
