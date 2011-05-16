include_recipe "python"

python_pip "websocket-client" do
  action :install
end

python_pip "PyYAML" do
  action :install
end

template "/etc/jellyfish.yml" do
  source "jellyfish.yml.erb"
  variables( :id => node[:jellyfish][:id],
             :endpoint => node[:jellyfish][:endpoint],
             :command => node[:jellyfish][:command] )
end
