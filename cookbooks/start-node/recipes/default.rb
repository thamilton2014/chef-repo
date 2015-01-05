#
# Cookbook Name:: start-node
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

if platform_family? 'windows'
  batch 'Download selenium server' do
    code 'echo "Download selenium server"'
    action :run
  end
elsif platform_family? 'mac_os_x'
  bash 'Download selenium server' do
    execute 'echo "Download selenium server"'
    action :run
  end
else
  print 'Platform not supported'
end