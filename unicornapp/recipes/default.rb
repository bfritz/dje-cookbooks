include_recipe "bluepill"

gem_package "unicorn"

directory "/etc/unicorn" do
  owner "root"
  group "root"
  mode "755"
end

directory "/var/run/unicorn" do
  owner "www-data"
  group "www-data"
end
