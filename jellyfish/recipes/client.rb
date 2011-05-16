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
