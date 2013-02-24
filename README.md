ruby-1.9.3-rpm-box
==================

[![Build Status](https://travis-ci.org/hansode/ruby-1.9.3-rpm-box.png)](https://travis-ci.org/hansode/ruby-1.9.3-rpm-box)

Build system wide ruby-1.9.3-rpm using [https://github.com/hansode/ruby-1.9.3-rpm](https://github.com/hansode/ruby-1.9.3-rpm) spec file.

Usage
-----

### Setup git submodules.

```
$ make
```

### Build rpm on running system.

```
$ make test
```

### Build architecture-specific rpm.

```
$ make i686
=> ruby-1.9.3pXXX-2.el6.i386.rpm
```

```
$ make x86_64
=> ruby-1.9.3pXXX-2.el6.x86_64.rpm
```
