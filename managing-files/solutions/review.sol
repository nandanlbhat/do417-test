---
- name: Deploying Files to Managed Hosts Lab
  hosts: all
  tasks:
    - name: IIS Web Server started
      win_feature:
        name: Web-Server
        state: present

    - name: Hosts file template deployed
      win_template:
        src: templates/index.html.j2
        dest: C:\Inetpub\wwwroot\index.html
        backup: yes

    - name: User write permission is denied
      win_acl:
        path: C:\Inetpub\wwwroot\index.html
        user: Users
        rights: Write
        type: deny
        state: present
