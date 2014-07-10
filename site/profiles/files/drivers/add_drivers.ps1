# add_drivers.ps1
#
# Read .inf listings in c:\itc\etc\drivers.ini
# use pnputil to add them into the windows 
# driver store.
#
#


$certs   = Get-Content c:\itc\etc\certs.ini

foreach ($cert in $certs){
  certutil.exe -addstore "TrustedPublisher" $cert
}



$drivers = Get-Content c:\itc\etc\drivers.ini

foreach ($inf in $drivers){

  PnPutil.exe -a $inf
}

