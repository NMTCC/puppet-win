Facter.add(:queues) do
  confine :operatingsystem => :windows

  setcode do
    queuelist = []
    names = []
    shares = []
    powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
    command = `Get-WmiObject -Class Win32_Printer`
    blob = Facter::Util::Resolution.exec(%Q{#{powershell} -command "#{command}"})
    blob.each_line do |l|
      if l =~ /Name/
        names << l.split(':').gsub(/ /, '').chomp
      end
    end
    blob.each_line do |l|
      if l =~ /ShareName/
        shares << l.split(':').gsub(/ /,'').chomp
      end
    end
    for q in 1..names.length
      if shares[q - 1].include? 'paperhost'
        next
      end
      if shares[q - 1] == ''
        if names[q - 1].include? 'paperhost'
          next
        end
      end
      queuelist << names[q - 1]
    end
    result = queuelist
  end

end
