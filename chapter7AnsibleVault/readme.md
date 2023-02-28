## encryt a file
ansible-vault encrypt vars/api_key.yml
ansible-playbook main.yml --ask-vault-pass


## deencryt a file
ansible-vault decrypt vars/api_key.yml


## edit the file without storing it decypted
ansible-vault edit vars/api_key.yml


## edit the  vault password
ansible-vault rekey vars/api_key.yml


## we can supplt a password file, typically in .ansible directory
ansible-playbook main.yml --vault-password-file ~/.ansible/api-key-vault.txt