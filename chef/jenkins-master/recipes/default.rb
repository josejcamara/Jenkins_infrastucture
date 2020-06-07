#
# Cookbook:: jenkins-master
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

include_recipe 'apt::default'

# include_recipe 'java'
package 'openjdk-8-jre-headless'

package 'unzip'

# if node['jenkins-server']['nginx']['install']
#   include_recipe 'jenkins-server::nginx'
# end

include_recipe 'jenkins::master'

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
