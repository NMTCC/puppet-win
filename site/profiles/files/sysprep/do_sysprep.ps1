c:\itc\bin\add_drivers.ps1
rm -r C:\ProgramData\PuppetLabs\puppet\etc\ssl
c:\windows\system32\sysprep\sysprep /generalize /oobe /shutdown /unattend:c:/itc/etc/unattend_sysprep.xml
