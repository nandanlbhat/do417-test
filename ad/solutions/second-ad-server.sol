---
- name: Creating an additional AD controller
  hosts: all
  vars:
    domainname: EXAMPLE.COM
    dnsname: example.com
    domain_admin: Administrator@example.com
    safe_password: RedHat123@!

  tasks:
    - name:  Promoting the server to an AD controller
      win_domain_controller:
        dns_domain_name: "{{ dnsname }}"
        domain_admin_user: "{{ domain_admin }}"
        domain_admin_password: "{{ password }}"
        safe_mode_password: "{{ safe_password }}"
        state: domain_controller
      register: domain_state

    - name: Rebooting to join the domain
      win_reboot:
        msg: "Rebooting..."
        reboot_timeout: 30
      when: domain_state.reboot_required
      ignore_errors: True
