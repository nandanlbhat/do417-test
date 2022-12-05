---
- name: Populate AD with additional hosts
  hosts: all
  vars:
    domainname: EXAMPLE.COM
    dnsname: example.com

  tasks:
    - name: A new Linux host is added to the "{{ domainname }}" AD domain
      win_domain_computer:
        name: LINUX1
        dns_hostname: linux1.{{ dnsname }}
        ou: "CN=Computers,DC=example,DC=com"
        description: Linux server example
        enabled: yes
        state: present

    - name: A new Windows host is added to the "{{ domainname }}" AD domain
      win_domain_computer:
        name: WIN_TEST
        sam_account_name: win_test$
        dns_hostname: win_test.{{ dnsname }}
        ou: "CN=Computers,DC=example,DC=com"
        description: Windows server example
        state: present