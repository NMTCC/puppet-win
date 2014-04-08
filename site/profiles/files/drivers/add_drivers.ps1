# add_drivers.ps1
#
# Read .inf listings in c:\tcc\etc\drivers.ini
# use pnputil to add them into the windows 
# driver store.
#
#


$certs   = Get-Content c:\tcc\etc\certs.ini

foreach ($cert in $certs){
  certutil.exe -addstore "TrustedPublisher" $cert
}



$drivers = Get-Content c:\tcc\etc\drivers.ini

foreach ($inf in $drivers){

  PnPutil.exe -a $inf
}

