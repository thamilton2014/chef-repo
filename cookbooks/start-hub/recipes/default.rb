#
# Cookbook Name:: start-hub
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

link = 'http://selenium-release.storage.googleapis.com/2.44/selenium-server-standalone-2.44.0.jar'
jarfile = 'selenium-server-standalone-2.44.0.jar'
server = 'http://10.44.72.123:4444/grid/register'

directory '/opt/selenium' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  not_if { ::File.exists? '/opt/selenium' }
end

execute "wget #{link}"

execute "java -jar #{jarfile} -role hub #{server} &"
