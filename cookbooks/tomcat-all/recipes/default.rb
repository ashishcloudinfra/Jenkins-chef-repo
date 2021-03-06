#
# Cookbook Name:: tomcat-all
# Recipe:: default
#
# Copyright (C) 2014 asihsh cloud infra
# Copyright (C) 2015 ashish cloud
#
# All rights reserved - Do Not Redistribute
#

# Build download URL
tomcat_version = node['tomcat-all']['version']
major_version = tomcat_version[0]
download_url = "#{node['tomcat-all']['download_server']}dist/tomcat/tomcat-#{major_version}/v#{tomcat_version}/bin/apache-tomcat-#{tomcat_version}.tar.gz"
# download_url = 'http://mirror.fibergrid.in/apache/tomcat/tomcat-7/v7.0.68/bin/apache-tomcat-7.0.68.tar.gz'

# Create group
group node['tomcat-all']['group']

# Create user
user node['tomcat-all']['user'] do
  group node['tomcat-all']['group']
  system true
  shell '/bin/bash'
end

# Download and unpack tomcat
ark 'tomcat' do
  url download_url
  version node['tomcat-all']['version']
  home_dir node['tomcat-all']['tomcat_home']
  owner node['tomcat-all']['user']
  group node['tomcat-all']['group']
end

# Log rotation (catalina.out)
template '/etc/logrotate.d/tomcat' do
  source 'logrotate.conf.erb'
  mode '0644'
  owner node['tomcat-all']['user']
  group node['tomcat-all']['group']
end

# Tomcat server configuration
template "#{node['tomcat-all']['tomcat_home']}/conf/server.xml" do
  source 'server.conf.erb'
  mode '0644'
  owner node['tomcat-all']['user']
  group node['tomcat-all']['group']
end

# Tomcat catalina configuration
template "#{node['tomcat-all']['tomcat_home']}/bin/setenv.sh" do
  source 'setenv.sh.erb'
  mode '0755'
  owner node['tomcat-all']['user']
  group node['tomcat-all']['group']
end

# Tomcat init script configuration
template "/etc/init.d/tomcat#{major_version}" do
  source 'init.conf.erb'
  mode '0755'
  owner node['tomcat-all']['user']
  group node['tomcat-all']['group']
end

include_recipe 'tomcat-all::set_tomcat_home'

# Create default catalina.pid file to prevent restart error for 1st run of coookbook.
file "#{node['tomcat-all']['tomcat_home']}/catalina.pid" do
  owner node['tomcat-all']['user']
  group node['tomcat-all']['group']
  mode '0755'
  action :create
  not_if { ::File.exist?("#{node['tomcat-all']['tomcat_home']}/catalina.pid") }
end
=begin
# Enabling tomcat service and restart the service if subscribed template has changed.
service "tomcat#{major_version}" do
  supports :restart => true
  action :enable
  subscribes :restart, "template[/etc/init.d/tomcat#{major_version}]", :delayed
  subscribes :restart, "template[#{node['tomcat-all']['tomcat_home']}/bin/setenv.sh]", :delayed
  subscribes :restart, "template[#{node['tomcat-all']['tomcat_home']}/conf/server.xml]", :delayed
end
=end
