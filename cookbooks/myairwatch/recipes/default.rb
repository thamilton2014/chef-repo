#
# Cookbook Name:: myairwatch
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

file = 'sharedlibs-unit_tests-lastest.tar'
repo = "http://10.44.72.81:8081/artifactory/sharedlibs/#{file}"
folder = '/opt/myairwatch/'

directory folder do
  user 'root'
  action :create
end

remote_file "#{folder}/#{file}" do
  source repo
end

execute 'Install sharedlibs' do
  cwd folder
  command "tar -xvf #{file}"
  action :run
end

cookbook_file 'phpinfo.php' do
  path '/var/www/html/phpinfo.php'
  action :create_if_missing
end

execute 'Configure sites-enables' do
  command 'cp /etc/httpd/sites-available/default.conf /etc/httpd/sites-enabled/'
  action :run
end

execute 'Cheating by turning off iptables... should be configured though...' do
  command 'service iptables stop'
  action :run
end

execute 'Cheating by flushing iptables... for extra measure, you know?' do
  command 'iptables -F'
  action :run
end