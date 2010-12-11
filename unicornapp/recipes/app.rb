include_recipe "unicorn"

template "/etc/unicorn/app.rb" do
  source "app.rb.erb"
  owner "root"
  group "root"
  mode "644"
  variables( :worker_processes => node.cpu.total,
             :cow_friendly => node.unicorn.copy_on_write_friendly )
end

template "/etc/bluepill/app" do
  source "app.pill.erb"
  variables :environment => node.unicorn.environment
end

template "/etc/init/app.conf" do
  source "app.upstart.erb"
end

service "app" do
  provider Chef::Provider::Service::Upstart
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

bluepill_service "app" do
  action [:enable, :load, :start]
end
