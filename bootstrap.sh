echo "                             _                       "
echo "                            | |                      "
echo " _ __   _____      ___ __ __| |_ __ _   _ _ __ ___   "
echo "| '_ \ / _ \ \ /\ / / '__/ _| | |__| | | | '_   _ \  "
echo "| |_) | (_) \ V  V /| | | (_| | |  | |_| | | | | | | "
echo "| .__/ \___/ \_/\_/ |_|  \__,_|_|   \__,_|_| |_| |_| "
echo "| |                                                  "
echo "|_|                                                  "
echo "                                                     "
sh -c 'mkdir -p /tmp/powrdrum/chef/cookbooks/pivotal_workstation && cd /tmp/powrdrum/chef/cookbooks/pivotal_workstation && curl -Ls http://github.com/jorbabe/pivotal_workstation/tarball/master | gunzip | tar xvf - --strip=1'

which rvm
RVM_INSTALLED=$?
if [ $RVM_INSTALLED -ne 0 ];then
  echo "Installing RVM"
  bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
  echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function' >> ~/.bash_profile
  source ~/.bash_profile
  rvm install ruby-1.9.2-p290
else
	echo "RVM already installed"
fi

which gem
GEMS_INSTALLED=$?
if [ $GEMS_INSTALLED -ne 0 ];then
  echo "Installing Rubygems..."
  cd /tmp/powrdrum
  curl -LOs http://production.cf.rubygems.org/rubygems/rubygems-1.6.2.tgz
  tar zxvf rubygems-1.6.2.tgz && cd rubygems-1.6.2 && ruby setup.rb
else
   echo "Rubygems already installed...skipping..."
fi
gem install soloist --no-ri --no-rdoc && gem install bundler --no-ri --no-rdoc
cd /tmp/powrdrum && curl -O https://raw.github.com/jorbabe/powrdrum/master/soloistrc && soloist
SOLOIST_SUCESS=$?

if [ $SOLOIST_SUCESS -eq 0 ];then
	open https://github.com/jorbabe/powrdrum/raw/master/drummer.gif
	say -v Alex Dum dum dee dum dum dum dum dee Dum dum dee dum dum dum dum dee dum dee dum dum dum de dum dum dum dee dum dee dum dum dee dummmmmmmmmmmmmmmmm
else
   	say -v Alex O No
	echo "FAIL."
fi