include_recipe "jellyfish::source"
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
  notifies :restart, "service[jellyfish]"
end

file "/usr/src/jellyfish/jellyfish-client.py" do
  mode "755"
end

service "jellyfish" do
  start_command "/usr/src/jellyfish/jellyfish-client.py"
  stop_command "pkill -f jellyfish-client"
  status_command "pgrep -f jellyfish-client"
  action [:start]
end
