#
# We'll install the package this time, but could be also done by using the official nginx recipe
# https://supermarket.chef.io/cookbooks/nginx
#

package 'nginx' do
    action :install
end

service 'nginx' do
    action [ :enable, :start ]
end

template "/etc/nginx/conf.d/jenkins.conf" do   
    source "nginx/jenkins.conf.erb"
end

template "/etc/nginx/nginx.conf" do   
    source "nginx/nginx.conf.erb"
    notifies :reload, "service[nginx]"
end
