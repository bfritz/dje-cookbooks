version = node[:nagios_plugins][:version]
path = "/usr/src/nagios-plugins-#{version}"

remote_file "#{path}.tar.gz" do
  source "http://downloads.sourceforge.net/project/nagiosplug/nagiosplug/#{version}/nagios-plugins-#{version}.tar.gz"
  checksum node[:nagios_plugins][:checksum]
end

execute "untar nagios plugins" do
  command "tar xzf nagios-plugins-#{version}.tar.gz"
  cwd "/usr/src"
  creates path
end

execute "configure nagios plugins" do
  command "./configure " +
    "--prefix=/usr/local/icinga " +
    "--with-cgiurl=/icinga/cgi-bin " +
    "--with-htmurl=/icinga " +
    "--with-nagios-user=icinga " +
    "--with-nagios-group=icinga"
  cwd path
  creates "#{path}/config.log"
end

execute "make nagios plugins" do
  command "make"
  cwd path
  creates "#{path}/plugins-root/check_icmp"
end

execute "install nagios plugins" do
  command "make install"
  cwd path
  creates "/usr/local/icinga/libexec/check_icmp"
end
