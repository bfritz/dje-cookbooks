include_recipe "icinga::utterramblings"

%w( php
    php-cli
    php-xmlrpc
    php-xml
    php-pdo
    php-gd
    php-ldap ).each do |p|
  execute "install #{p}" do
    command "yum -y install #{p}"
    not_if "yum list installed #{p} | grep 5.2.16"
  end
end

execute "install php-pear" do
  command "yum -y install php-pear"
  not_if "yum list installed php-pear | grep 1.9.1"
end

execute "upgrade pcre" do
  command "yum -y upgrade pcre"
  not_if "yum list installed pcre | grep 8.02"
end

=begin

cookbook_file "/usr/lib64/mysql/libmysqlclient.so.16.0.0" do
  mode "755"
end

link "/usr/lib64/mysql/libmysqlclient.so.16" do
  to "/usr/lib64/mysql/libmysqlclient.so.16.0.0"
end

rpm = "php-mysql-5.2.16-jason.1.x86_64.rpm"

remote_file "/usr/src/#{rpm}" do
  source "http://www.jasonlitka.com/media/EL5/x86_64/#{rpm}"
  checksum "453dbbbe"
end

execute "install php-mysql" do
  command "rpm --nodeps --install #{rpm}"
  creates "/usr/lib64/php/modules/pdo_mysql.so"
end

=end
