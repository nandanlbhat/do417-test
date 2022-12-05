---
- name: Configure a host using DSC
  hosts: all

  tasks:
       
    - name: Create a new directory
      win_dsc:
        resource_name: File
        DestinationPath: C:\DO417\dsc-usage-example
        Ensure: Present
        Type: Directory

    - name: Create a new file with text
      win_dsc:
        resource_name: File
        DestinationPath: C:\DO417\dsc-usage-example\new-file.txt
        Contents: |
            Hello
            This is the DO417 course.
        Ensure: Present
        Type: File

    - name: Copy a zip file to the managed host
      win_copy:
        src: do417-example.zip
        dest: C:\DO417\dsc-usage-example\do417-example.zip
    
    - name: Extract a zip file in the new directory
      win_dsc:
        resource_name: Archive
        Destination: C:\DO417\dsc-usage-example\extracted-zip
        Path: C:\DO417\dsc-usage-example\do417-example.zip
        Ensure: Present