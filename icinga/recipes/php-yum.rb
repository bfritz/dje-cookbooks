# http://www.if-not-true-then-false.com/2010/install-apache-php-on-fedora-centos-red-hat-rhel/

execute "add remi repository" do
  command "rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-5.rpm"
  creates "/etc/yum.repos.d/remi.repo"
end

execute "install php" do
  command "yum --enablerepo=remi install -y httpd php php-common"
  not_if "php --version | grep 5.3"
end

%w( php-xmlrpc
    php-xml
    php-pdo
    php-gd
    php-ldap
    php-mysql ).each do |p|
  execute "install #{p}" do
    command "yum --enablerepo=remi install -y #{p}"
    not_if "yum --enablerepo=remi list installed #{p} | grep 5.3"
  end
end

execute "install php-pear" do
  command "yum --enablerepo=remi install -y php-pear"
  not_if "yum --enablerepo=remi list installed php-pear | grep 1.9"  
end
