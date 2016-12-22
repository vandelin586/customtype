require 'spec_helper'

describe 'customtype' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "customtype class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('customtype::params') }
          it { is_expected.to contain_class('customtype::install').that_comes_before('customtype::config') }
          it { is_expected.to contain_class('customtype::config') }
          it { is_expected.to contain_class('customtype::service').that_subscribes_to('customtype::config') }

          it { is_expected.to contain_service('customtype') }
          it { is_expected.to contain_package('customtype').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'customtype class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('customtype') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
