---
- name: Configure login message
  hosts: win1.example.com
  vars:
    message_key: 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System'

  tasks:
    - name: Configure login message caption
      win_regedit:
        path: '{{ message_key }}'
        name: legalnoticecaption
        data: 'Hello!'
        type: string

    - name: Configure login message text
      win_regedit:
        path: '{{ message_key }}'
        name: legalnoticetext
        data: >
          'Welcome to the {{ ansible_facts["fqdn"] }}({{ ansible_facts["ip_addresses"][0] }}) system.
          This system is running {{ ansible_facts["distribution"] }}, and has
          {{ ansible_facts["processor_count"] }} cpu/s and {{ ansible_facts["memtotal_mb"] }} MiB of RAM.'
        type: string
