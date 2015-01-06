#
# Cookbook Name:: myairwatch-ssh-keys
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

users = {
    :thamilton => 'Thomas Hamilton'
}

users.each do |username, fullname|

  execute 'Installing users' do
    command "adduser #{username}"
    not_if "cat /etc/passwd | grep #{username}"
    action :run
  end

  directory "/home/#{username}/.ssh" do
    action :create
  end

  cookbook_file "#{username}.pub" do
    path "/home/#{username}/.ssh/#{username}.pub"
    action :create_if_missing
  end

end

execute 'Restarting sshd' do
  command '/etc/init.d/sshd restart'
  action :run
end


