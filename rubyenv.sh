sudo apt-get -y install git make gcc gem bundler
sudo apt-get -y install libssl-dev libreadline-dev zlib1g-dev

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH=$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

source ~/.bash_profile
rbenv --version

rbenv install 2.2.3
rbenv global 2.2.3

sudo apt-get -y install libmysqlclient-dev
sudo apt-get -y install mysql-server-5.6 mysql-client-core-5.6
bin/spring binstub rspec
bin/setup
bin/rails s
