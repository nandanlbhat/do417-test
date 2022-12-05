---

- name: Apply system updates 
  hosts: win1.example.com

  tasks:
    - name: Security updates applied
      win_updates:
        category_names: SecurityUpdates
        state: installed
      notify:
      -  Server is rebooted

  handlers:
    - name: Server is rebooted
      win_reboot: