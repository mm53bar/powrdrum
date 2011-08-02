curl -O http://files.rubyforge.vm.bytemark.co.uk/rubygems/rubygems-1.6.2.tgz
tar xvzf rubygems-1.6.2.tgz
cd rubygems-1.6.2 && ruby setup.rb
gem install soloist --no-ri --no-rdoc
gem install bundler --no-ri --no-rdoc
mkdir -p chef/cookbooks/pivotal_workstation && cd chef/cookbooks/pivotal_workstation && curl -L http://github.com/jorbabe/pivotal_workstation/tarball/master | gunzip | tar xvf - --strip=1
soloist