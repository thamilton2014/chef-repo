#
# Cookbook Name:: myairwatch-install-user
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
    owner "#{username}"
    group "#{username}"
    mode '0755'
    action :create
  end

  cookbook_file "#{username}.pub" do
    owner "#{username}"
    group "#{username}"
    mode '0755'
    path "/home/#{username}/.ssh/#{username}.pub"
    action :create_if_missing
  end

  file "/home/#{username}/.ssh/authorized_keys" do
    owner "#{username}"
    group "#{username}"
    mode '0700'
    action :create_if_missing
  end

  execute 'Adding user to authorized_keys' do
    command "cat /home/#{username}/.ssh/#{username}.pub >> /home/#{username}/.ssh/authorized_keys"
    action :run
  end

  execute 'Add user to wheel' do
    command "usermod -a -G wheel #{username}"
    action :run
  end

end

execute 'Restarting sshd' do
  command '/etc/init.d/sshd restart'
  action :run
end


