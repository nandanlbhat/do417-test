---
- name: Create a local user
  hosts: all

  tasks:
    - name: John Snow user is created
      win_user:
        name: John Snow
        password: RedHat123@!
        state: present
        groups:
          - Users

    - name: Adding John Snow to the Print operators group
      win_group_membership:
        name: Print operators
        members:
          - John Snow
        state: present