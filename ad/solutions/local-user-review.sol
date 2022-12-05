---
- name: Create a local user
  hosts: all

  tasks:
    - name: Two local users are created
      win_user:
        name: "{{ item }}"
        password: RedHat123@!
        state: present
        group:
          - Users
      loop:
        - Review User1
        - Review User2

    - name: The Review User1 user is added to the Print operators group
      win_group_membership:
        name: Print operators
        members:
          - Review User1
        state: present