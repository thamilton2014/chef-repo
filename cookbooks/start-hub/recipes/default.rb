#
# Cookbook Name:: start-hub
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
version = '2.44'
selenium = "selenium-server-standalone-#{version}.0.jar"

selenium_dir = '/opt/selenium'

directory selenium_dir do
  action :create
end

cookbook_file selenium do
  path "#{selenium_dir}/#{selenium}"
  action :create_if_missing
end

execute 'Execute selenium server' do
  cwd selenium_dir
  command "java -jar #{selenium} -role hub &"
  not_if 'ps aux | grep "[s]elenium"'
  action :run
end

