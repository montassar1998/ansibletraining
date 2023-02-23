we will see a multi-host ad-hoc orchestration
-b : become root server 
-B : delay 
-P 0 : pass the output to no hop, command will go back to your terminal
`ansible -i inventory db -b -B  3600 -P 0 -a "yum -y update"`

sample output:
192.168.2.7 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "ansible_job_id": "949608450447.29746",
    "changed": true,
    "finished": 0,
    "results_file": "/root/.ansible_async/949608450447.29746",
    "started": 1
}
`ansible -i inventory db -b -m  async_status -a "jid=488518886700.29290"`
sample output:
192.168.2.7 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "ansible_job_id": "488518886700.29290",
    "changed": true,
    "cmd": [
        "yum",
        "-y",
        "update"
    ],
    "delta": "0:00:00.417633",
    "end": "2023-02-23 13:12:31.629201",
    "finished": 1,
    "msg": "",
    "rc": 0,
    "results_file": "/root/.ansible_async/488518886700.29290",
    "start": "2023-02-23 13:12:31.211568",
    "started": 1,
    "stderr": "",
    "stderr_lines": [],
    "stdout": "Loaded plugins: fastestmirror\nLoading mirror speeds from cached hostfile\n * base: it1.mirror.vhosting-it.com\n * epel: it1.mirror.vhosting-it.com\n * extras: it1.mirror.vhosting-it.com\n * updates: it1.mirror.vhosting-it.com\nNo packages marked for update",
    "stdout_lines": [
        "Loaded plugins: fastestmirror",
        "Loading mirror speeds from cached hostfile",
        " * base: it1.mirror.vhosting-it.com",
        " * epel: it1.mirror.vhosting-it.com",
        " * extras: it1.mirror.vhosting-it.com",
        " * updates: it1.mirror.vhosting-it.com",
        "No packages marked for update"
    ]
}


Ansible logs
---------

`ansible -i inventory  multi -b -a "tail /var/log/messages"`

note: it is a best practise not to use shell module: it can handle pipes ....
`ansible -i inventory  multi -b -m shell -a "cat /var/log/messages | grep ansible-command"`
`ansible -i inventory  multi -b -m shell -a "cat /var/log/messages | grep ansible-command | wc -l"`
create  a cronJob
`ansible -i inventory  multi -b -m cron -a "name=soemthing hour=1 job=~/script.sh"`
delete a cornJob
`ansible -i inventory  multi -b -m cron -a "name=soemthing hour=1 job=~/script.sh state=absent"`



`
[ssh_connection]
pipelining = True
`
using ssh pipelining, the server will reuse that connection to spped up playbook execution time