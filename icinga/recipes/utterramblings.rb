execute "install key" do
  command "rpm --import http://www.jasonlitka.com/media/RPM-GPG-KEY-jlitka"
  action :nothing
end

template "/etc/yum.repos.d/utterramblings.repo" do
  notifies :run, "execute[install key]", :immediately
end
