include_recipe "jellyfish::source"
include_recipe "jellyfish::erlang"

git "/usr/src/misultin" do
  repository "https://github.com/ostinelli/misultin.git"
  reference "master"
  action :sync
end

execute "compile misultin" do
  command "make"
  cwd "/usr/src/misultin"
  creates "/usr/src/misultin/ebin"
end

link "/usr/local/lib/erlang/lib/misultin-0.7.1" do
  to "/usr/src/misultin"
end
