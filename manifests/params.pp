# == Class: sysadmin::params
# Get the proper packages names
class sysadmin::params {
  case $::osfamily {
    'Debian': {
      $mtr = 'mtr-tiny'
      $vim = 'vim'
      $iptraf = 'iptraf'
    }
    'RedHat': {
      $mtr = 'mtr'
      $vim = 'vim-enhanced'
      $iptraf = $::operatingsystem  ? {
        'Fedora' => 'iptraf-ng',
        default  => 'iptraf',
      }
    }
    default: {
      $mtr = 'mtr-tiny'
      $vim = 'vim'
      $iptraf = 'iptraf'
    }
  }
}
