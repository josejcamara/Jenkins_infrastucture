#
# Cookbook:: jenkins-master
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

# Instalation steps from:
# https://youtu.be/B9zhtyIazzM
# https://www.jenkins.io/doc/book/installing/#debianubuntu

# wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key
remote_file '/tmp/jenkins-ci.org.key' do
    source 'https://pkg.jenkins.io/debian-stable/jenkins.io.key'
    notifies :run, 'execute[apt-key add /tmp/jenkins-ci.org.key]', :immediately
end
# | sudo apt-key add -
execute 'apt-key add /tmp/jenkins-ci.org.key' do
    action :nothing
end

# sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
file '/etc/apt/sources.list.d/jenkins.list' do
    content 'deb https://pkg.jenkins.io/debian-stable binary/'
    notifies :run, 'execute[apt-get update]', :immediately
end

# sudo apt-get update
execute 'apt-get update' do
    action :nothing
end

# Found this issue with the installation
# https://issues.jenkins-ci.org/browse/JENKINS-31814
package 'openjdk-8-jre-headless'

# sudo apt-get install jenkins
package 'jenkins' do
    version '2.222.3'
    action :install
end
