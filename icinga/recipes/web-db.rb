include_recipe "percona::create"

cookbook_file "/usr/src/icinga_web.sql"

execute "initialize icinga web database" do
  command "mysql icinga_web < /usr/src/icinga_web.sql"
  not_if "mysql --silent --skip-column-names \
      --execute=\"show tables in icinga_web\" | grep cronk"
end
