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
role = 'hub'

directory '/opt/selenium' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

bash 'Download selenium server' do
  user 'root'
  group 'root'
  cwd '/opt/selenium'
  code <<-EOH
    wget #{link}
  EOH
end

bash 'Install and start selenium hub server' do
  user 'root'
  cwd '/opt/selenium'
  code <<-EOH
    java -jar #{jarfile} -role #{role}
  EOH
end