export EC2_HOME=/usr/local/ec2
export EC2_URL=https://ec2.eu-west-1.amazonaws.com
export JAVA_HOME=/usr/lib/jvm/java-6-openjdk/jre
export EC2_PRIVATE_KEY=/var/local/scripts/ec2_snapshots_s3/pk-WJXC5FOEVRY6QTM.pem
export EC2_CERT=/var/local/scripts/ec2_snapshots_s3/cert-WJXC5FOEVRY6QTM.pem
 
# TOC instance list
# i-d64455a0 exchange-build
# i-f0e1dfb9 connect-jenkins-build
 
if [ -z "$1" ]
then
  echo "Usage: `basename $0` <AWS ID>" >&2
  # Error message to stderr.
  exit $E_NOARGS
fi 
 
/usr/local/ec2/bin/ec2-start-instances $1
 
#sleep 90
 
if [ "$1" == i-d64455a0 ]; then
  ELASTIC_IP="79.125.107.40"
elif [ "$1" == i-f0e1dfb9 ]; then
  ELASTIC_IP="46.137.157.129"
 
else
  echo "$1 doesn't match 'i-d64455a0'or'i-f0e1dfb9'"
  exit 1
fi
 
/usr/local/ec2/bin/ec2-associate-address $ELASTIC_IP -i $1
