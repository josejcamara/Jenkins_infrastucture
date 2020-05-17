#
# Cookbook:: jenkins-master
# Recipe:: default

apt_update 'Update the apt cache daily' do
    frequency 86_400
    action :periodic
end

package 'git'
package 'tree'

package 'nginx' do
  action :install
end


service 'nginx' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end


cookbook_file "/var/www/html/index.html" do
  source "index.html"
  mode "0644"
end
template "/etc/nginx/nginx.conf" do   
  source "nginx.conf.erb"
  notifies :reload, "service[nginx]"
end
  