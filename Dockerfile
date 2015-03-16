FROM ubuntu:trusty
MAINTAINER Tyler Langlois

RUN apt-get -y update
RUN apt-get install -y wget
RUN wget -O /tmp/puppetlabs-release-trusty.deb https://apt.puppetlabs.com/puppetlabs-release-trusty.deb && dpkg -i /tmp/puppetlabs-release-trusty.deb && rm /tmp/puppetlabs-release-trusty.deb
RUN apt-get -y update
RUN apt-get install -q -y puppet=3.7.4-1puppetlabs1 facter

ADD puppet /etc/puppet

CMD ["puppet", "apply", "/etc/puppet/manifests"]
