---
- name: Install the IIS web service
  hosts: win1.example.com

  tasks:

    - name: IIS service installed
      win_feature:
        name: Web-Server
        state: present

    - name: IIS service started
      win_service:
        name: W3Svc
        state: started

    - name: Website index.html created
      win_copy:
        content: "Ansible is great"
        dest: C:\Inetpub\wwwroot\index.html

    - name: Team-Application is installed
      win_feature:
        name: Team-Application
        state: present
      ignore_errors: yes

    - name: Homepage index is set 
      win_uri:
        url: http://win1.example.com
        return_content: yes
      register: index
      failed_when: index.content != "Ansible is great"

