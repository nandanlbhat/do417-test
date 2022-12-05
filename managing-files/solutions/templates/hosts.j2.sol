# Host: {{ ansible_facts.hostname }}
# Updated At: {{ now() }}

{{ hostvars['win1.example.com'].ansible_facts.ip_addresses[0] }}  www1.example.com
{{ hostvars['win2.example.com'].ansible_facts.ip_addresses[0] }}  www2.example.com
