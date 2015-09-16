# Defines an easy type for installing Windows network printers.
define printers::printer($queue=$title, $server='paperhost') {
  exec { "add-printer-${title}":
    provider => 'powershell',
    command  => "\$(New-Object -ComObject WScript.Network).AddWindowsPrinterConnection(\"\\\\${server}\\${title}\")",
    onlyif   => "if ( \$(Get-WmiObject -Class Win32_Printer | Where { \$_.ShareName -Match \"${title}\$\" } | Select -ExpandProperty ShareName) -eq \"${title}\" ) { exit 1 }",
  }
}
