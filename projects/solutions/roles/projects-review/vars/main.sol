---
file_name: "{{ directory_location }}new-file.txt"
windows_resource: WindowsFeature
feature_name: telnet-client
zip_file_location: files/do417-example.zip
zip_remote_location: "{{ directory_location }}do417-example.zip"
zip_extracted_location: "{{ directory_location }}extracted-zip"