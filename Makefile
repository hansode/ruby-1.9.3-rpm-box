all:
	git submodule update --init --recursive

test: common

common:
	time sudo ./vmbuilder/kvm/rhel/6/vmbuilder.sh \
	--execscript ./execscript-ruby193.sh   \
	--devel-user ruby193 \
	--distro-arch `arch`

i686:
	time sudo ./vmbuilder/kvm/rhel/6/vmbuilder.sh \
	--execscript ./execscript-ruby193.sh   \
	--devel-user ruby193 \
	--distro-arch $@

x86_64:
	time sudo ./vmbuilder/kvm/rhel/6/vmbuilder.sh \
	--execscript ./execscript-ruby193.sh   \
	--devel-user ruby193 \
	--distro-arch $@
