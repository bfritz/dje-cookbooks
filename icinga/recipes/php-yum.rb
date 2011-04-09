execute "install key" do
  command "rpm --import http://www.jasonlitka.com/media/RPM-GPG-KEY-jlitka"
  action :nothing
end

template "/etc/yum.repos.d/utterramblings.repo" do
  notifies :run, "execute[install key]", :immediately
end

%w( php
    php-cli
    php-xmlrpc
    php-pdo
    php-gd
    php-ldap
    php-mysql ).each do |p|
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

