---
- name: Joining an existing AD domain
  hosts: all
  vars:
    domainname: EXAMPLE.COM
    dnsname: example.com
    domain_admin: Administrator@example.com

  tasks:
    - name: Joining the domain "{{ domainname }}"
      win_domain_membership:
        dns_domain_name: "{{ dnsname }}"
        domain_admin_user: "{{ domain_admin }}"
        domain_admin_password: "{{ password }}"
        state: domain
      register: domain_state

    - name: Rebooting to join the domain
      win_reboot:
        msg: "Rebooting..."
      when: domain_state.reboot_required