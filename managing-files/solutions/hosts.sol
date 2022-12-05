---
- name: Web server with custom hosts file deployed
  hosts: all
  tasks:
    - name: IIS Web Server started
      win_feature:
        name: Web-Server
        state: present

    - name: Index file is created
      win_copy:
        content: "Hello from {{ ansible_hostname }}!"
        dest: C:\Inetpub\wwwroot\index.html

    - name: Hosts file template deployed
      win_template:
        src: templates/hosts.j2
        dest: C:\Windows\System32\drivers\etc\hosts
        backup: yes
