sh -c 'mkdir -p chef/cookbooks/pivotal_workstation && cd chef/cookbooks/pivotal_workstation && curl -Ls http://github.com/jorbabe/pivotal_workstation/tarball/master | gunzip | tar xvf - --strip=1'
which gem
OUT=$?
if [ $OUT -ne 0 ];then
  curl -LOs http://production.cf.rubygems.org/rubygems/rubygems-1.6.2.tgz
  tar zxvf rubygems-1.6.2.tgz && cd rubygems-1.6.2 && ruby setup.rb
else
   echo "Rubygems already installed...skipping..."
fi
gem install soloist --no-ri --no-rdoc && gem install bundler --no-ri --no-rdoc
soloist
open https://github.com/jorbabe/workstation_bootstrap/raw/master/drummer.gif
say 'Now go buy Jordan a coffee and go write some code!'