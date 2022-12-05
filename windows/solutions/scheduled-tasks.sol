- name: Create a scheduled task
  hosts: win1.example.com
  vars:
    ps_script: 'pingHosts.ps1'

  tasks:
    - name: Script directory is created
      win_file:
        path: C:\Scripts\
        state: directory

    - name: PowerShell script is transferred
      win_copy:
       src: "files/{{ ps_script }}"
       dest: C:\Scripts\

    - name: A scheduled task is created
      win_scheduled_task:
        name: QueryHosts
        description: >
          Run a PowerShell script that uses ping to reach a servers
          in the environment
        author: student@example.com
        enabled: true
        actions:
        - path: C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
          arguments: >
            -ExecutionPolicy Unrestricted
            '-NonInteractive -File C:\Scripts\{{ ps_script }}'
        triggers:
        - type: boot
        - type: logon
        priority: 1
        state: present

    - name: Status of the task is retrieved
      win_scheduled_task_stat:
        name: QueryHosts
      changed_when: False
