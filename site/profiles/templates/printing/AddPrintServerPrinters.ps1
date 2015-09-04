$log = "c:\itc\log\add_printers.log"
$ErrorActionPreference
$ErrorActionPreference = "Continue"
get-date | %{$start = $_; $_; $_ > $log}

#1. Disable the "Do you trust this printer?" driver installation dialogue
#2. Remove Shut Down, Restart, Sleep, and Hibernate buttons
#3. Disable display of last user name
$reg_file = 'c:\itc\etc\point_and_print.reg'
reg.exe import $reg_file | %{$_; $_ >> $log}

$printserver = 'paperhost'

#Get printers already added to this computer
$added_printers = Get-WmiObject -Class Win32_Printer | where name -like "\\$printserver*" | select -expa ShareName | sort
"Printers already added: $added_printers" | %{$_; $_ >> $log}

#Printers to add from print server (with drivers on print server)
$printers = 'cramer114 fidel130 fidel130-color library122 library208 library208-color library22 msec187 south218 speare116 speare117 speare142 speare16 speare23-color speare23a speare23b speare4a speare4b speare5 speare5-color transparency weir128 weir209 presidents113 speare112 torres130 west219'.split()
"Target printers: $printers" | %{$_; $_ >> $log}

$wnet = New-Object -ComObject WScript.Network

#Login to paperhost as a TCC7 user
$pw = '<%= @domainadmin %>'
net.exe use \\paperhost $pw /user:tcc7\admin | %{$_; $_ >> $log}

#For each targeted printer
$printers | ForEach-Object {

    #If printer is already added
    if ($added_printers -ccontains $_) {
        "$_ already added" | %{$_; $_ >> $log}
    }
    #Else add this printer
    else {
        $PortName = "\\$printserver\$_"
        "Adding $PortName ..." | %{$_; $_ >> $log}
        $wnet.AddWindowsPrinterConnection($PortName) | %{$_; $_ >> $log}
    }
}

get-date | %{$end = $_; $_; $_ >> $log}
"Time for script to run was: $($end - $start)" | %{$_; $_ >> $log}
