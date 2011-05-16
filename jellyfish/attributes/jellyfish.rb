default[:jellyfish][:id] = "please_generate_me"
default[:jellyfish][:endpoint] = "http://jlyfsh.com/deploy"
default[:jellyfish][:command] = "/usr/local/bin/ruby /usr/bin/chef-client --logfile /var/log/chef/client.log"

default[:erlang][:version] = "R14B02"
default[:erlang][:checksum] = "849d050b"

set[:python][:install_method] = "source"
