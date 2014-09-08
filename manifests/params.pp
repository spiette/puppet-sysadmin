# == Class: sysadmin::params
# Get the proper packages names
class sysadmin::params {
  case $::osfamily {
    'Debian': {
      $mtr = 'mtr-tiny'
      $vim = 'vim'
      $iptraf = 'iptraf'
      $iperf = 'iperf'
    }
    'RedHat': {
      $mtr = 'mtr'
      $vim = 'vim-enhanced'
      if (
        ($::operatingsystem == 'Fedora'
        or
        $::operatingsystemmajrelease > 6)
        or
        ( $::operatingsystem == 'Amazon' and $::operatingsystemmajrelease > 3 )
      ) {
        $iptraf = 'iptraf-ng'
        $iperf = 'iperf3'
      } else {
        $iptraf = 'iptraf'
        $iperf = 'iperf'
      }
    }
    default: {
      $mtr = 'mtr-tiny'
      $vim = 'vim'
      $iptraf = 'iptraf'
      $iperf = 'iperf'
    }
  }
}
