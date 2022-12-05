---
- name: Configure a host using a role
  hosts: all
  roles:
    - role: projects-review
      directory_location: C:\DO417\projects-review-role\