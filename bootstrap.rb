`sh -c 'mkdir -p /usr/local/src/workstation_bootstrap_tmp && cd /usr/local/src/workstation_bootstrap_tmp && curl -L https://github.com/jorbabe/workstation_bootstrap/tarball/master | gunzip | tar xvf - --strip=1'`

`cd /usr/local/src/workstation_bootstrap_tmp && chmod +x bootstrap.sh && ./bootstrap.sh`

`which gem`
if $? != 0
	`curl -O http://files.rubyforge.vm.bytemark.co.uk/rubygems/rubygems-1.6.2.tgz && tar xvzf rubygems-1.6.2.tgz && cd rubygems-1.6.2 && ruby setup.rb`
	`gem install soloist --no-ri --no-rdoc && gem install bundler --no-ri --no-rdoc`
	`mkdir -p chef/cookbooks/pivotal_workstation && cd chef/cookbooks/pivotal_workstation && curl -L http://github.com/jorbabe/pivotal_workstation/tarball/master | gunzip | tar xvf - --strip=1`
	`soloist`
end