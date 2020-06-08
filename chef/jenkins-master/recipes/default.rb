#
# Cookbook:: jenkins-master
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

include_recipe 'apt::default'

['unzip','git'].each do |p|
    package p do
      action :install
    end
  end

# include_recipe 'java'
package 'openjdk-8-jre-headless'

###### attributes -> default['jenkins']['http_proxy']...
# if node['jenkins-server']['nginx']['install']
#   include_recipe 'jenkins-server::nginx'
# end

include_recipe 'jenkins::master'

JENKINS_HOME = node['jenkins']['master']['home']
SSL_DIR = File.join(JENKINS_HOME, "ssl")
SSH_DIR = File.join(JENKINS_HOME, ".ssh")
[ SSL_DIR, SSH_DIR ].each do |dir_name|
    directory dir_name do
        owner node['jenkins']['master']['user']
        group node['jenkins']['master']['group']
        mode '0700'
        recursive true
    end
end

# Create private key file
file File.join("#{SSH_DIR}","id_rsa") do
    content node['jenkins-master']['dev_mode']['security']['private_key']
    owner node['jenkins']['master']['user']
    group node['jenkins']['master']['group']
    mode 0600
    action :create
end

# Create public key file
file File.join("#{SSH_DIR}","id_rsa.pub") do
    content node['jenkins-master']['dev_mode']['security']['public_key']
    owner node['jenkins']['master']['user']
    group node['jenkins']['master']['group']
    mode 0644
    action :create
    # notifies :create, "ruby_block[store_ssh_public_key]", :immediately
end



# include_recipe 'jenkins-master::settings'

# include_recipe 'jenkins-master::user'
# include_recipe 'jenkins-master::plugins'

# include_recipe 'jenkins-master::security'
# include_recipe 'jenkins-server::views'
# include_recipe 'jenkins-server::jobs'
# include_recipe 'jenkins-server::composer'

# if node['jenkins-server']['slaves']['enable']
#   include_recipe 'jenkins-server::slaves_credentials'
#   include_recipe 'jenkins-server::slaves'
# end

# After finishing any config, it's needed to restart for running init scripts
# jenkins_command 'safe-restart'
# Remove folder of init scripts
# directory "#{node['jenkins']['master']['home']}/init.groovy.d" do
#   action :delete
# end
