---
- name: Configure web server
  hosts: all
  gather_facts: false

  tasks:
    - name: Include the environment task file and set the variables
      include_tasks: tasks/environment.yml
      vars:
        iis_package_names:
          - Web-Server
          - Web-Asp-Net45

    - name: Import the site task file and set the variables
      import_tasks: tasks/site.yml
      vars:
        iis_site_path: C:\sites\projects
        iis_site_name: "DO417-projects"
        iis_site_port: 8080

    - name: Import the firewall task file and set the variable
      import_tasks: tasks/firewall.yml
      vars:
        iis_site_port: 8080

- name: Import test play file and set the variable
  import_playbook: plays/test.yml
  vars:
    url: 'http://win1.example.com:8080'
