# == Class: sysadmin
#
# This class provides packages for common sysadmin tools
#
# === Parameters
#
# [*ensure*]
# This parameter will be passed to the package resource. Valid values are
# present, latest, absent. It defaults to present.
#
# === Examples
#
#  class { 'sysadmin':
#    ensure => latest
#  }
#
# === Authors
#
# Simon Piette <simon.piette@savoirfairelinux.com>
#
# === Copyright
#
# Copyright 2013 Simon Piette
#
class sysadmin ($ensure=present) {
  package { [
    'curl',
    'dstat',
    'ethtool',
    'iotop',
    'iperf',
    'iptraf',
    'mtr',
    'screen',
    'sysstat',
    'traceroute',
    'vim-enhanced',
  ]:
    ensure => $ensure,
  }
}
