# Defines an easy type for installing Windows network printers.
define printers::printer($queue=$title, $server='paperhost.nmt.edu') {
  exec { "add-printer-${title}":
    provider  => 'powershell',
    command   => "rundll32 printui.dll,PrintUIEntry /ga /n\\\\${server}\\${queue}",
  }
}