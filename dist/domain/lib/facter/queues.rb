Facter.add(:queues) do
  confine :operatingsystem => :windows

  setcode do
    queuelist = []
    names = []
    shares = []
    blob = `Get-WmiObject -Class Win32_Printer`
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
