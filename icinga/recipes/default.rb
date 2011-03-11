#
# Cookbook Name:: icinga
# Recipe:: default
#
# Copyright 2011, Heavy Water Software Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "apache2"

user "icinga"

group "icinga" do
  case node[:platform]
  when "ubuntu", "debian"
    members [ "icinga", "www-data" ]
  when "redhat", "centos", "fedora"
    members [ "icinga", "apache" ]
  end
end

group "icinga-cmd" do
  members ["icinga" ]
end

case node[:platform]
when "ubuntu", "debian"
  package "libgd2-xpm-dev"
  package "libjpeg62"
  package "libjpeg62-dev"
  package "libpng12"
  package "libpng12-dev"
  package "snmp"
  package "libsnmp5-dev"
when "redhat", "centos", "fedora"
  package "gd"
  package "gd-devel"
  package "libjpeg"
  package "libjpeg-devel"
  package "libpng"
  package "libpng-devel"
  package "net-snmp"
  package "net-snmp-devel"
end

version = node[:icinga][:version]
path = "/usr/src/icinga-#{version}"

remote_file "#{path}.tar.gz" do
  source "http://downloads.sourceforge.net/project/icinga/icinga/#{version}/icinga-#{version}.tar.gz"
  checksum node[:icinga][:checksum]
end

execute "untar icinga" do
  command "tar xzf icinga-#{version}.tar.gz"
  creates path
  cwd "/usr/src"
end

execute "configure icinga" do
  command "./configure --with-command-group=icinga-cmd"
  creates "#{path}/config.log"
  cwd path
end

execute "build icinga" do
  command "make all"
  creates "#{path}/common/shared.o"
  cwd path
end

execute "install icinga" do
  command "make fullinstall"
  creates "/usr/local/icinga/bin/icinga"
  cwd path
end

template "/usr/local/icinga/etc/objects/contacts.cfg" do
  source "contacts.cfg.erb"
  owner "icinga"
  group "icinga"
  variables( :email => node[:icinga][:email] )
end
