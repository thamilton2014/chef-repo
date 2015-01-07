#
# Cookbook Name:: start-node
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

version = '2.44'
selenium = "selenium-server-standalone-#{version}.0.jar"

server = 'http://10.44.73.64:4444/grid/register'

mac_chrome_driver = 'chromedriver'
mac_safari_driver = '/Applications/Safari.app/Contents/MacOS/Safari'

win_chrome_driver = 'chromedriver_win.exe'
win_ie_driver = 'IEDriverServer.exe'

if platform_family? 'mac_os_x'

  selenium_dir = '/Users/administrator/selenium/'

  directory selenium_dir do
    user 'administrator'
    action :create
  end

  cookbook_file selenium do
    path "#{selenium_dir}/#{selenium}"
    action :create_if_missing
  end

  cookbook_file mac_chrome_driver do
    path "/usr/bin/#{mac_chrome_driver}"
    action :create_if_missing
  end

  execute 'Execute selenium server' do
    cwd selenium_dir
    command "java -Dwebdriver.safari.driver=#{mac_safari_driver} -jar #{selenium} -role node -hub #{server} &"
    not_if 'ps aux | grep "[s]elenium"'
    action :run
  end

elsif platform_family? 'windows'

  selenium_dir = "C:\\Users\\admin\\Desktop\\selenium\\"

  directory selenium_dir do
    action :create
  end

  cookbook_file selenium do
    path "#{selenium_dir}\\#{selenium}"
    action :create_if_missing
  end

  cookbook_file win_chrome_driver do
    path "#{selenium_dir}\\#{win_chrome_driver}"
    action :create_if_missing
  end

  cookbook_file win_ie_driver do
    path "#{selenium_dir}\\#{win_ie_driver}"
    action :create_if_missing
  end

  execute 'Execute selenium server' do
    cwd selenium_dir
    command "java -Dwebdriver.chrome.driver=#{win_chrome_driver} -Dwebdriver.ie.driver=#{win_ie_driver}-jar #{selenium} -role node -hub #{server}"
    not_if 'ps aux | grep "[s]elenium"'
    action :run
  end

elsif platform_family? 'linux'
  echo 'Not implemented yet...'
else
  print 'Platform not supported'
end