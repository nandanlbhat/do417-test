---
- name: IIS Web Server started
  win_feature:
    name: Web-Server
    state: present

- name: HTTP Tracing is installed
  win_feature:
    name: Web-Http-Tracing
    state: present
  when: debug_tools

- name: Index page is deployed
  win_template:
    src: index.html.j2
    dest: C:\Inetpub\wwwroot\index.html

- name: Info page is deployed
  win_copy:
    src: info.html
    dest: C:\Inetpub\wwwroot\info.html
