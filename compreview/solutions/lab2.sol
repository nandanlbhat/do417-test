---
- name: Gather facts to populate hostvars
  hosts: Windows

- name: Configure the win2 host
  hosts: win2.example.com
  gather_facts: no
  vars:
    etc_dir: 'C:\Windows\System32\drivers\etc'
    disabled_services:
      - AppHostSvc
      - lfsvc
      - Spooler
      - SSDPSRV

  tasks:
    - name: Configure hosts file from template
      win_template:
        src: templates/hosts.j2
        dest: '{{ etc_dir }}\hosts'

    - name: Reduce server footprint
      win_service:
        name: "{{ item }}"
        start_mode: disabled
        state: stopped
      loop: "{{ disabled_services }}"
      ignore_errors: yes

