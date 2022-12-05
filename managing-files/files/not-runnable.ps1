$ws = New-Object -ComObject Wscript.Shell
$ws.Popup("This example script will not run after Ansible modifies its permissions.", 0, "Warn", 0x40)
