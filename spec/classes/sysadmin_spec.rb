require 'spec_helper'

describe 'sysadmin' do
  let(:title) { 'sysadmin' }
  osfamily = 'RedHat'
  let(:facts) { { :osfamily => osfamily } }
  describe "sysadmin class on #{osfamily}" do 
    it { should contain_package('curl').with_ensure('present') }
    it { should contain_package('dstat').with_ensure('present') }
    it { should contain_package('ethtool').with_ensure('present') }
    it { should contain_package('iotop').with_ensure('present') }
    it { should contain_package('iperf').with_ensure('present') }
    it { should contain_package('iptraf').with_ensure('present') }
    it { should contain_package('mtr').with_ensure('present') }
    it { should contain_package('screen').with_ensure('present') }
    it { should contain_package('sysstat').with_ensure('present') }
    it { should contain_package('traceroute').with_ensure('present') }
    it { should contain_package('vim-enhanced').with_ensure('present') }
  end
  describe "sysadmin class ensure => absent on #{osfamily}" do 
    let(:params) { { :ensure          => 'absent' } }
    it { should contain_package('curl').with_ensure('absent') }
    it { should contain_package('dstat').with_ensure('absent') }
    it { should contain_package('ethtool').with_ensure('absent') }
    it { should contain_package('iotop').with_ensure('absent') }
    it { should contain_package('iperf').with_ensure('absent') }
    it { should contain_package('iptraf').with_ensure('absent') }
    it { should contain_package('mtr').with_ensure('absent') }
    it { should contain_package('screen').with_ensure('absent') }
    it { should contain_package('sysstat').with_ensure('absent') }
    it { should contain_package('traceroute').with_ensure('absent') }
    it { should contain_package('vim-enhanced').with_ensure('absent') }
  end
end

