SHELL=/bin/bash

all:
	git submodule update --init --recursive

test: common

common:
	time sudo ./vmbuilder/kvm/rhel/6/vmbuilder.sh \
	--config-path ./vmbuilder.conf

i686:
	time sudo setarch $@ ./vmbuilder/kvm/rhel/6/vmbuilder.sh \
	--config-path ./vmbuilder.conf

x86_64:
	time sudo setarch $@ ./vmbuilder/kvm/rhel/6/vmbuilder.sh \
	--config-path ./vmbuilder.conf
