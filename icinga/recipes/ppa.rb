package "python-software-properties"

execute "apt-get update" do
  command "apt-get update"
  action :nothing
end

execute "ppa:arnd-arndnet/icinga" do
  command "add-apt-repository ppa:arnd-arndnet/icinga"
  creates "/etc/apt/sources.list.d/arnd-arndnet-icinga-lucid.list"
  notifies :run, "execute[apt-get update]", :immediately
end

package "icinga" do
  options "--force-yes"
end

