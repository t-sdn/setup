#!/bin/bash

# Check the current user is root or not.
if [ $EUID -ne 0 ]; then
    echo "You're not root user. using sudo to continue."
    sudo $0 -s $*
    exit 0
fi

# Update repository
echo "Update repository ..."
apt-get update -qq

# Install dependencies
echo "Installing JDK and other dependencies ..."
apt-get install -qq curl git openjdk-7-jre openjdk-7-jdk

# Maven 3.0.1 or higher required.
echo "Download and install maven3 ..."
curl -sSL http://archive.apache.org/dist/maven/maven-3/3.3.1/binaries/apache-maven-3.3.1-bin.tar.gz |\
    tar -C /opt/ -xzf -
ln -sf /opt/apache-maven-3.3.1/bin/mvn /usr/bin/mvn

# Copy maven settings
echo "Copying maven settings ..."
if [ -x ~/.m2/settings.xml ]; then
    mv ~/.m2/settings.xml{,.bak}
fi
mkdir -p ~/.m2
chown -R $SUDO_USER:$SUDOUSER ~/.m2
curl -sSL -o ~/.m2/settings.xml \
    https://raw.githubusercontent.com/opendaylight/odlparent/master/settings.xml

# Setting maven opts
echo "Setting maven options to profile ..."
echo "export MAVEN_OPTS='-Xmx1048m -XX:MaxPermSize=1024m'" | tee -a ~/.bashrc

echo "Done!"
