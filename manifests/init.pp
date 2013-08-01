# == Class: sysadmin
#
# This class provides packages for common sysadmin tools that won't be in any
# other modules.
#
# === Parameters
#
# [*ensure*]
# This parameter will be passed to the package resource. Valid values are
# present, latest, absent. It defaults to present.
#
# [*vim*]
# Most of the time, you'll want a more refined vim module to handle
# configuration and plugins. But if you just want the vim package, just set
# this to true. It defaults to false.
#
# [*sysstat*]
# Sysstat is a package that you may want to tweak and let it have its own
# module. If this is the case and you want to handle the package installation
# elsewhere, set this to false and the sysadmin module won't install sysstat.
# It defaults to true.
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
class sysadmin (
  $ensure=present,
  $sysstat=true,
  $vim=false,
  ) {
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
    $sysadmin::params::iptraf,
    $sysadmin::params::mtr,
    'screen',
    'traceroute',
    'wget',
  ]:
    ensure => $ensure,
  }
  if $vim == true {
    package { $sysadmin::params::vim:
      ensure => $ensure
    }
  }
  if $sysstat == true {
    package { 'sysstat':
      ensure => $ensure
    }
  }
}
