---
- name: Populate hostvars
  hosts: win*.example.com

- name: SNMP configured on server
  hosts: win2.example.com
  gather_facts: no
  tasks:
    - name: SNMP configured using a role
      vars:
        snmp_access_address: "{{ hostvars['win1.example.com']['ansible_ip_addresses'][0] }}"
        snmp_community: public
        snmp_contact: Adam Admin
        snmp_location: Arizona
        snmp_monitoring_server: "{{ hostvars['win1.example.com']['ansible_ip_addresses'][0] }}"
        snmp_password: Password1!
        snmp_user: admin

      import_role:
        name: ansible.snmp

- name: SNMP configured on client
  hosts: win1.example.com
  gather_facts: no
  vars:
    package: snmpb

  tasks:
    - name: Chocolatey is installed
      win_chocolatey:
        name: chocolatey
        state: present

    - name: Packages are installed
      win_chocolatey:
        name: "{{ package }}"
        state: present
        pinned: true
