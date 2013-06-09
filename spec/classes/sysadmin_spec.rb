require 'spec_helper'

describe 'sysadmin' do
  let(:title) { 'sysadmin' }
  ['Debian','RedHat'].each do |osfamily|
    case osfamily
    when 'Debian'
        mtr = 'mtr-tiny'
        vim = 'vim'
    when 'RedHat'
        mtr = 'mtr'
        vim = 'vim-enhanced'
    else
        mtr = 'mtr'
        vim = 'vim'
    end
    packages = [
      'acpid',
      'blktrace',
      'curl',
      'dstat',
      'ethtool',
      'gawk',
      'iotop',
      'iperf',
      'iptraf',
      mtr,
      'screen',
      'sysstat',
      'traceroute',
      vim,
      'wget',
    ]
    describe "sysadmin class on #{osfamily}" do
      let(:facts) { { :osfamily => osfamily } }
      it { should contain_class('sysadmin') }
      packages.each do |package|
        it { should contain_package(package).with_ensure('present') }
      end
    end
    describe "sysadmin class ensure => absent on #{osfamily}" do
      let(:params) { { :ensure => 'absent' } }
      let(:facts) { { :osfamily => osfamily } }
      it { should contain_class('sysadmin') }
      packages.each do |package|
        it { should contain_package(package).with_ensure('absent') }
      end
    end
    if osfamily == 'RedHat'
      describe "sysadmin class in Fedora" do
        let(:facts) { {
          :osfamily => osfamily,
          :operatingsystem => 'Fedora'
        } }
        it { should contain_package('iptraf-ng').with_ensure('present') }
      end
    end
  end
end

