include_recipe "bluepill"

package "pdns-backend-sqlite3"
package "libsqlite3-dev"

gem_package "dnsimple-pdns-provider"
gem_package "unicorn"

config_path = node.pdns_provider.config_path
db = "#{node.pdns_provider.db_path}/#{node.pdns_provider.db}"

directory config_path

template "#{config_path}/config.yml" do
  source "config.yml.erb"
  variables( :db => db,
             :nameservers => [ node.ipaddress ],
             :secret => node.pdns_provider.shared_secret )
end

template "#{config_path}/config.ru" do
  source "config.ru.erb"
  variables :config => "#{config_path}/config.yml"
end

template "#{config_path}/config.rb" do
  source "config.rb.erb"
end

cookbook_file "/usr/src/powerdns.sql"

directory node.pdns_provider.db_path

execute "initialize powerdns sqlite db" do
  command "sqlite3 #{db} < /usr/src/powerdns.sql"
  not_if "test -f #{db}"
end

template "/etc/powerdns/pdns.conf" do
  source "pdns.conf.erb"
  variables( :db => db )
end

service "pdns" do
  pattern "pdns_server"
  action [ :enable, :start ]
end

directory "/etc/bluepill"

template "/etc/bluepill/pdns-provider" do
  source "pdns-provider.pill.erb"
  variables( :unicorn_config => "#{config_path}/config.rb",
             :rack_config => "#{config_path}/config.ru" )
end

template "/etc/init/pdns-provider.conf" do
  source "pdns-provider.upstart.erb"
end

service "pdns-provider" do
  provider Chef::Provider::Service::Upstart
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

bluepill_service "pdns-provider" do
  action [ :enable, :start ]
end
