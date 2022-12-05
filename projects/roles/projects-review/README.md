Role Name
=========

This creates a directory, files, and extracts a zip file, it also installs a Windows Feature.

Requirements
------------

It doesn't need any requirements.
It is compatible with all Windows Versions.

Role Variables
--------------

directory_location: C:\DO417\projects-review\ # default directory that the role will create and use to unzip the archive and create the new file.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - name: New role
      hosts: all
      roles:
        - role: projects-review
          directory_location: C:\DO417\projects-review-role\
License
-------

GPLv3

Author Information
------------------

Artur Glogowski <aglogows@redhat.com>
