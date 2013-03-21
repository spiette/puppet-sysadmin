# == Class: sysadmin::params
# Get the proper packages names
class sysadmin::params {
  case $::osfamily {
    'Debian': {
      $mtr = 'mtr-tiny'
      $vim = 'vim'
    }
    'RedHat': {
      $mtr = 'mtr'
      $vim = 'vim-enhanced'
    }
    default: {
      $mtr = 'mtr-tiny'
      $vim = 'vim'
    }
  }
}
