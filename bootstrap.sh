# Setup PHP

# Setup Sinatra

# Setup
# http://www.quora.com/Whats-a-good-Python-equivalent-to-Rubys-Sinatra

#!/bin/bash

# copy interview-questions.conf
sudo cp `pwd`/bootstrap/interview-questions.conf /private/etc/apache2/other/interview-questions.conf

ROOT_DIR=`pwd`
ROOT_DIR=${ROOT_DIR//\//\\\/}

sudo sed -ie s/%%PWD%%/$ROOT_DIR/g /private/etc/apache2/other/interview-questions.conf

# update /etc/hosts
if [ `grep -c "interview-php.dev" /etc/hosts` -eq 0 ]
then
  echo '' | sudo tee -a /etc/hosts
  echo '# Via interview-questions' | sudo tee -a /etc/hosts
  echo '127.0.0.1 interview-php.dev' | sudo tee -a /etc/hosts
fi

if [ `grep -c "interview-rb.dev" /etc/hosts` -eq 0 ]
then
  echo '127.0.0.1 interview-rb.dev' | sudo tee -a /etc/hosts
fi

if [ `grep -c "interview-py.dev" /etc/hosts` -eq 0 ]
then
  echo '127.0.0.1 interview-py.dev' | sudo tee -a /etc/hosts
fi

# restart apache
sudo apachectl -k restart

# make sure rvm is installed
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
  source "$HOME/.rvm/scripts/rvm"
elif [[ -s "/usr/local/rvm/scripts/rvm" ]] ; then
  source "/usr/local/rvm/scripts/rvm"
else
  printf "ERROR: An RVM installation was not found. Checkout dayone to get it https://github.com/isocket/dayone \n"
  exit 0
fi

# use (create if doesn't exist) 1.9.3 w/ buyadspro gemset
rvm use --create 1.9.3@interview-questions

# install bundler and have it use the Gemfile to determine what else we need
gem install bundler --no-rdoc --no-ri && bundle install