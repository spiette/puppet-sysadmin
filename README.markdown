# sysadmin
[![Build Status](https://travis-ci.org/spiette/puppet-sysadmin.png)](https://travis-ci.org/spiette/puppet-sysadmin)

This is the sysadmin module. It installs packages for system administration that won't make it in other modules.

* acpid
* blktrace
* curl
* dstat
* ethtool
* iotop
* iftop
* iptraf(-ng)
* iperf
* mtr
* screen
* sysstat (can be disabled)
* traceroute
* vim (optionnaly)
* wget

### Parameters

- *ensure*
  (present|latest|absent)
  This parameter will be passed to package.

- *vim*
  Most of the time, you'll want a more refined vim module to handle
  configuration and plugins. But if you just want the vim package, just set
  this to true. It defaults to false.

- *sysstat*
  Sysstat is a package that you may want to tweak and let it have its own
  module. If this is the case and you want to handle the package installation
  elsewhere, set this to false and the sysadmin module won't install sysstat.
  It defaults to true.

# License
Apache License 2.0

# Contact
Simon Piette <piette.simon@gmail.com>

# Support

Please log tickets and issues at our [Projects site](https://github.com/spiette/puppet-sysadmin)
