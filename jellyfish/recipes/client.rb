include_recipe "python"

%w( websocket-client
    PyYAML
    python-daemon ).each do |p|
  python_pip p do
    action :install
  end
end

template "/etc/jellyfish.yml" do
  source "jellyfish.yml.erb"
  variables( :id => node[:jellyfish][:id],
             :endpoint => node[:jellyfish][:endpoint],
             :command => node[:jellyfish][:command] )
end

template "/etc/init/jellyfish-client.conf" do
  source "jellyfish-upstart.erb"
  notifies :restart, "service[jellyfish-client]"
end

service "jellyfish-client" do
  provider Chef::Provider::Service::Upstart
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end
