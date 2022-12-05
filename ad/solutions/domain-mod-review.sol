---
- name: Creating AD groups and users
  hosts: all
  vars:
    domainname: EXAMPLE.COM
    user_password: RedHat123@!

  tasks:
    - name: New group in the "{{ domainname }}" is created
      win_domain_group:
        name: Review Group
        scope: global

    - name: New user in the "{{ domainname }}" is created
      win_domain_user:
        name: oliver
        firstname:  Oliver
        lastname: Stone
        password: "{{ user_password }}"
        state: present
        groups:
          - Domain Users
          - Review Group