#!/bin/bash
export EC2_HOME=/usr/local/ec2
export EC2_URL=https://ec2.eu-west-1.amazonaws.com
export JAVA_HOME=/usr/lib/jvm/java-6-openjdk/jre
export EC2_PRIVATE_KEY=/var/local/scripts/ec2_snapshots_s3/pk-WJW55J7RY6QTM.pem
export EC2_CERT=/var/local/scripts/ec2_snapshots_s3/cert-WJXCW55J7RY6QTM.pem
 
/usr/local/ec2/bin/ec2-stop-instances i-d542fc9d 
 
sleep 30
 
echo "xxxxbuild should now be down"
 
# TOC instance list
# i-d542fc9d xxxxxbuild
