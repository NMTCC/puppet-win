Facter.add(:template) do
  confine :operatingsystem => :windows
  setcode do
    result = 'Spring2017-master.2'
    if File.file?('C:\Program Files\SII 9.2\Program\SWLauncher.exe')
      result = 'Spring2017-master.3'
    end
    result
  end
end
