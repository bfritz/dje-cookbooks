include_recipe "icinga::source"

case node[:platform]
when "ubuntu", "debian"
  include_recipe "php"
  package "php5-xmlrpc"
  package "php5-xsl"
  package "php5-pdo"
  package "php5-gd"
  package "php5-ldap"
  package "php5-mysql"
when "redhat", "centos", "fedora"
  include_recipe "icinga::php-yum"
end

include_recipe "apache2"
include_recipe "apache2::mod_rewrite"
apache_module "php5"

version = node[:icinga][:web][:version]
path = "/usr/src/icinga-web-#{version}"

remote_file "#{path}.tar.gz" do
  source "http://downloads.sourceforge.net/project/icinga/icinga-web/#{version}/icinga-web-#{version}.tar.gz"
  checksum node[:icinga][:web][:checksum]
end

execute "untar icinga-web" do
  command "tar xzf icinga-web-#{version}.tar.gz"
  cwd "/usr/src"
  creates path
end

execute "configure icinga-web" do
  command "./configure"
  cwd path
  creates "#{path}/config.log"
end

execute "install icinga-web" do
  command "make install"
  cwd path
  creates "/usr/local/icinga-web"
end

template "#{node[:apache][:dir]}/conf.d/icinga-web.conf" do
  source "icinga-web.conf.erb"
  notifies :restart, "service[apache2]"
end

directory "/usr/local/icinga-web/app/cache" do
  owner "apache"
  group "apache"
end
