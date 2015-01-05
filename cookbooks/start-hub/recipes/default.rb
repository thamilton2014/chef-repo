#
# Cookbook Name:: start-hub
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory '/opt/selenium' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

bash 'Download selenium server' do
  user 'root'
  cwd '/opt/selenium'
  code <<-EOH
    echo "Download here"
  EOH
end

bash 'Install and start selenium hub server' do
  user 'root'
  cwd '/opt/selenium'
  code <<-EOH
    echo "Start server here"
  EOH
end