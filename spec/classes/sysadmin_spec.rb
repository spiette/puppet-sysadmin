require 'spec_helper'

describe 'sysadmin' do
  let(:title) { 'sysadmin' }
  ['Debian','RedHat'].each do |osfamily|
    case osfamily
    when 'Debian'
      mtr = 'mtr-tiny'
      vim = 'vim'
      iperf = 'iperf'
      iptraf = 'iptraf'
    when 'RedHat'
      operatingsystemrelease = 7
      mtr = 'mtr'
      vim = 'vim-enhanced'
      if ( operatingsystemrelease > 6 )
        iperf = 'iperf3'
        iptraf = 'iptraf-ng'
      else
        iptraf = 'iptraf'
        iperf = 'iperf'
      end
    else
      mtr = 'mtr'
      vim = 'vim'
      iperf = 'iperf'
      iptraf = 'iptraf'
    end
    packages = [
      'acpid',
      'blktrace',
      'curl',
      'dstat',
      'ethtool',
      'gawk',
      'iftop',
      'iotop',
      iperf,
      iptraf,
      mtr,
      'screen',
      'traceroute',
      vim,
      'wget',
    ]
    describe "class on #{osfamily}" do
      let(:facts) { {
        :osfamily => osfamily,
        :operatingsystemrelease => operatingsystemrelease
      } }
      it { should contain_class('sysadmin') }
      packages.each do |package|
        next if package == vim
        it { should contain_package(package).with_ensure('present') }
      end
    end
    describe "class w/o vim on #{osfamily}" do
      let(:params) { { :vim => false } }
      let(:facts) { {
        :osfamily => osfamily,
        :operatingsystemrelease => operatingsystemrelease
      } }
      it { should contain_class('sysadmin') }
      it { should_not contain_package(vim) }
    end
    describe "class with vim on #{osfamily}" do
      let(:params) { { :vim => true } }
      let(:facts) { {
        :osfamily => osfamily,
        :operatingsystemrelease => operatingsystemrelease
      } }
      it { should contain_class('sysadmin') }
      it { should contain_package(vim) }
    end
    describe "class on #{osfamily} with sysstat" do
      let(:params) { { :sysstat => false } }
      let(:facts) { {
        :osfamily => osfamily,
        :operatingsystemrelease => operatingsystemrelease
      } }
      it { should contain_class('sysadmin') }
      it { should_not contain_package('sysstat') }
    end
    describe "class on #{osfamily} w/o sysstat" do
      let(:params) { { :sysstat => false } }
      let(:facts) { {
        :osfamily => osfamily,
        :operatingsystemrelease => operatingsystemrelease
      } }
      it { should contain_class('sysadmin') }
      it { should_not contain_package('sysstat') }
    end
    describe "class ensure => absent on #{osfamily}" do
      let(:params) { { :ensure => 'absent' } }
      let(:facts) { {
        :osfamily => osfamily,
        :operatingsystemrelease => operatingsystemrelease
      } }
      it { should contain_class('sysadmin') }
      packages.each do |package|
        next if package == vim
        it { should contain_package(package).with_ensure('absent') }
      end
    end
    if osfamily == 'RedHat'
      describe "class in Fedora" do
        let(:facts) { {
          :osfamily => osfamily,
          :operatingsystem => 'Fedora',
          :operatingsystemrelease => '20'
        } }
        it { should contain_package('iptraf-ng').with_ensure('present') }
      end
      describe "class in EL7" do
        let(:facts) { {
          :osfamily => osfamily,
          :operatingsystem => 'RedHat',
          :operatingsystemrelease => operatingsystemrelease
        } }
        it { should contain_package('iptraf-ng').with_ensure('present') }
      end
    end
  end
end

