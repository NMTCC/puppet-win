Facter.add(:wgethashes) do
  confine :operatingsystem => :windows

  setcode do
    files = ['puppet.bat', 'DelProf2.exe', 'ChangeScreenResolution.exe']
    hashes = {}
    files.each do |f|
      md5 = `md5sums -u c:/itc/bin/#{f}`.split(' ')[0]
      if md5
        hashes[f] = md5.chomp
      else
        hashes[f] = 'unknown'
      end
    end
    result = hashes
  end

end
