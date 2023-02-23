use ad-hoc to setup a system  database and 2 application serversvagrant init geerlinggut/centos7
a multi-vm vagrant configuration

`vagrant init geerlinggut/centos7`

multi-host inventory 

-f NUMBER: number of parallel forks
`ansible multi -i inventory -a "hostname"`

to see everything ansible knows about the remote host 
`ansible multi -i inventory -m setup`

to run as a non standard user
`ansible multi -i inventory -b -m yum -a "name=ntp state=present" `
`ansible multi -i inventory --become -m yum -a "name=ntp state=present" `
if the user has a password to become a root user or -K
`ansible multi -i inventory --ask-become-pass -m yum -a "name=ntp state=present enabled=yes" `
make sure a service is started and enabled
`ansible multi -i inventory -b -m service -a "name=ntpd state=started enabled=yes"`
make sure a service is stopped in a different style
`ansible multi -i inventory -b  -a "service ntpd stop"`

force time update 
`ansible multi -i inventory -b  -a "ntpdate -q 0.rhel.pool.ntp.org"`

use the mysql module to connect to a db with a privilege on any host, with access to all databases *.* and all commands `ALL`
`ansible  -i inventory db -m mysql_user -a "name=django host=% password=ansible priv=*.*:All state=present"`

target specific host
`ansible  -i inventory app -a 'free -m' --limit '192.168.2.6'`
IPs ending in *.*.*.6
`ansible  -i inventory app -a 'free -m' --limit '*.6'`