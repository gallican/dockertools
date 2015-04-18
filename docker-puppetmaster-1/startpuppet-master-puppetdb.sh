#!/bin/sh
echo "stop old puppet"
sudo docker stop puppet
echo "remove old  puppet"
sudo docker rm puppet
echo "now run anew puppet"
sudo docker run --rm  -ti --name puppet --net host puppetmaster
exit
