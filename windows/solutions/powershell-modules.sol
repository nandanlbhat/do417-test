- name: Install PowerShell modules
  hosts: all
  vars:
    powershell_repo_endpoint: https://www.powershellgallery.com/api/v2/
    powershell_modules:
      - PSWindowsUpdate
      - Get-PSGoodFirstIssue

  tasks:
    - name: Current repositories are unregistered
      win_shell: Unregister-PSRepository "{{ item }}"
      ignore_errors: true
      loop:
        - PowerShell Gallery
        - PSGallery

    - name: Repository is added
      win_psrepository:
        source: "{{ powershell_repo_endpoint }}"
        name: PowerShell Gallery
        state: present

    - name: Repository is queried
      win_shell: Get-PSRepository "PowerShell Gallery"
      register: repo_status
      failed_when: repo_status.rc != 0
      changed_when: false

    - name: PowerShell modules are installed
      win_psmodule:
        name: "{{ item }}"
        state: present
      loop: "{{ powershell_modules }}"
