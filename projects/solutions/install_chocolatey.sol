---
- name: Installing chocolatey using a role with custom settings
  hosts: all
  tasks:
    - name: Install chocolatey with custom settings
      vars:
        chocolatey_config:
          - commandExecutionTimeoutSeconds: 2300
        chocolatey_feature:
          - virusCheck: true
          - usePackageRepositoryOptimizations: true
      import_role:
        name: ansible-chocolatey-role