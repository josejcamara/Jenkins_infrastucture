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

# package 'openjdk-8-jre-headless'
openjdk_install '11' # It looks like 8 is not available anymore

include_recipe 'jenkins::master'

include_recipe 'jenkins-master::plugins'
include_recipe 'jenkins-master::users'

include_recipe 'jenkins-master::nginx'
