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
which gem
OUT=$?
if [ $OUT -ne 0 ];then
  echo "Installing Rubygems..."
  cd /tmp/powrdrum
  curl -LOs http://production.cf.rubygems.org/rubygems/rubygems-1.6.2.tgz
  tar zxvf rubygems-1.6.2.tgz && cd rubygems-1.6.2 && ruby setup.rb
else
   echo "Rubygems already installed...skipping..."
fi
gem install soloist --no-ri --no-rdoc && gem install bundler --no-ri --no-rdoc
cd /tmp/powrdrum && curl -O https://raw.github.com/jorbabe/powrdrum/master/soloistrc && soloist
open https://github.com/jorbabe/powrdrum/raw/master/drummer.gif
say -v Alex Dum dum dee dum dum dum dum dee Dum dum dee dum dum dum dum dee dum dee dum dum dum de dum dum dum dee dum dee dum dum dee dummmmmmmmmmmmmmmmm