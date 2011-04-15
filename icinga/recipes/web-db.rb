include_recipe "mysql::server"

mysql_database "create icinga-web database" do
  host "localhost"
  username "root"
  password node[:mysql][:server_root_password]
  database "icinga_web"
  action :create_db
end
