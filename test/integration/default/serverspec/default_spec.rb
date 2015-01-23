require 'serverspec'
require 'net/http'
require 'uri'

set :backend, :exec
set :path, '/sbin:/usr/local/sbin:$PATH'

describe "docker setup" do
  describe file("/etc/default/docker") do
    it { should be_file }
    it {should be_owned_by "root"}
    it {should be_grouped_into "root"}
  end

  describe package("lxc-docker") do
    it { should be_installed }
  end

  describe service("docker") do
    it{ should be_enabled }
    it{ should be_running }
  end
end
