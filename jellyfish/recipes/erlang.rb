# I'm rolling my own Erlang install because (maybe) there was a crypto
# problem with Ubuntu's Erlang package that I couldn't be bothered to
# figure out. This is wrong, yet expedient for my purposes.

version = node[:erlang][:version]
path = "/usr/src/otp_src_#{version}"

remote_file "#{path}.tar.gz" do
  source "http://www.erlang.org/download/otp_src_#{version}.tar.gz"
  checksum node[:erlang][:checksum]
end

execute "untar erlang" do
  command "tar xzf otp_src_#{version}.tar.gz"
  cwd "/usr/src"
  creates path
end

execute "configure erlang" do
  command "./configure"
  cwd path
  creates "#{path}/config.log"
end

execute "make erlang" do
  command "make"
  cwd path
  creates "#{path}/bin/erl"
end

execute "install erlang" do
  command "make install"
  cwd path
  creates "/usr/local/bin/erl"
end
