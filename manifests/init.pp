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
# === Author
#
# Simon Piette <simon.piette@savoirfairelinux.com>
#
# === Copyright
#
# Copyright 2013 Simon Piette
#
class sysadmin ($ensure=present) {
  include sysadmin::params
  package { [
    'acpid',
    'blktrace',
    'curl',
    'dstat',
    'ethtool',
    'gawk',
    'iotop',
    'iftop',
    'iperf',
    'iptraf',
    $sysadmin::params::mtr,
    'screen',
    'sysstat',
    'traceroute',
    $sysadmin::params::vim,
    'wget',
  ]:
    ensure => $ensure,
  }
}
