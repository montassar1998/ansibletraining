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
`ansible multi -i inventory --ask-become-pass -m yum -a "name=ntp state=present" `