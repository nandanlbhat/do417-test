---
- name: Deploy website
  hosts: all
  vars:
    debug_tools: True

  pre_tasks:
    - debug:
        msg: Installing with debug tools enabled.
      when: debug_tools

  roles:
    - role: web
      site_title: Example Web Site

  post_tasks:
    - name: Custom page is added
      win_copy:
        content: "Hello!"
        dest: C:\Inetpub\wwwroot\example.html
