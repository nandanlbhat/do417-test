---
- name: Create a new directory
  win_dsc:
    resource_name: File
    DestinationPath: "{{ directory_location }}"
    Ensure: Present
    Type: Directory

- name: Create a new file with text
  win_dsc:
    resource_name: File
    DestinationPath: "{{ file_name }}"
    Contents: |
      Hello
      This is the DO417 course.
    Ensure: Present
    Type: File
    
- name: Install a Windows feature 
  win_dsc:
    resource_name: "{{ windows_resource }}"
    Name: "{{ feature_name }}"

- name: Copy a zip file to the managed host
  win_copy:
    src: "{{ zip_file_location }}"
    dest: "{{ zip_remote_location }}"
    
- name: Extract a zip file in the new directory
  win_dsc:
    resource_name: Archive
    Destination: "{{ zip_extracted_location }}"
    Path: "{{ zip_remote_location }}"
    Ensure: Present