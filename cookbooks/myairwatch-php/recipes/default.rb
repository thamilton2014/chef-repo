#
# Cookbook Name:: myairwatch-php
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
install_dir = '/opt/installation'
latest_php = 'http://php.net/get/php-5.6.4.tar.gz/from/this/mirror'
php_tar = 'php-5.6.4.tar.gz'
php_ver = 'php-5.6.4'

directory install_dir do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

bash 'Install php' do
  user 'root'
  group 'root'
  cwd install_dir
  code <<-EOH
    wget #{latest_php}
    tar -zxf #{php_tar}
    cd #{php_ver}
    ./configure
    make
    make install
  EOH
end

# Maybe check for curl installation
bash 'Download composer' do
  user 'root'
  group 'root'
  cwd install_dir
  code <<-EOH
    curl -sS https://getcomposer.org/installer | php
  EOH
end

# do a check for composer installation
bash 'Install composer globally' do
  user 'root'
  group 'root'
  cwd install_dir
  code <<-EOH
    mv composer.phar /usr/local/bin/composer
  EOH
end

bash 'Download phpunit' do
  user 'root'
  group 'root'
  cwd install_dir
  code <<-EOH
    wget https://phar.phpunit.de/phpunit.phar
  EOH
end

# do a check for phpunit installation
bash 'Install phpunit' do
  user 'root'
  group 'root'
  code <<-EOH
    chmod +x phpunit.phar
    sudo mv phpunit.phar /usr/local/bin/phpunit
    phpunit --version
  EOH
end

