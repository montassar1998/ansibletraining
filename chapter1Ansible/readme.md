custom anbible oinventory and config, override ansible config by creating ansible.cfg file

the default command in ansible is 'command' so no need to add it 
`ansible all  -a "free -h "  --private-key=~/.ssh/Key.pem -u ec2-user`
this is an example where we explicitely add a command, it will copy the file from local machine to ansible host
`ansible example -m copy -a "src=./doesnotexist dest=/home/ec2-user/file" --private-key=~/.ssh/Key.pem  -u ec2-user`


ansible-inventory --list -i inventory
ansible-doc module_name 



    - name: make sure apache is started