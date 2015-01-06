#
# Cookbook Name:: start-node
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

if platform_family? 'mac_os_x'
  execute 'echo Download server'
else
  print 'Platform not supported'
end