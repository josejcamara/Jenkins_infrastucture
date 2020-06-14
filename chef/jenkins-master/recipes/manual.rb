#
# Cookbook:: jenkins-master
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

# Instalation steps from:
# https://youtu.be/B9zhtyIazzM
# https://www.jenkins.io/doc/book/installing/#debianubuntu

include_recipe 'apt::default'

apt_repository 'jenkins' do
    uri   'https://pkg.jenkins.io/debian-stable' 
    distribution 'binary/'
    key   'https://pkg.jenkins.io/debian-stable/jenkins.io.key' 
  end

# Found this issue with the installation
# https://issues.jenkins-ci.org/browse/JENKINS-31814
package 'openjdk-8-jre-headless'

# sudo apt-get install jenkins
package 'jenkins' do
    version '2.222.3'
    action :install
end
