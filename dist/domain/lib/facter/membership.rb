Facter.add(:partofdomain) do
  confine :operatingsystem => :windows
  setcode do
    result = ''
    require 'win32ole'
    wmi = WIN32OLE.connect('winmgmts://./root/CIMV2')
    query = wmi.ExecQuery('Select * from Win32_ComputerSystem')
    query.each do |computer|
      result = computer.partofdomain
      break
    end
    result
  end
end

Facter.add(:addomain) do
  confine :operatingsystem => :windows
  setcode do
    result = ''
    require 'win32ole'
    wmi = WIN32OLE.connect('winmgmts://./root/CIMV2')
    query = wmi.ExecQuery('Select * from Win32_ComputerSystem')
    query.each do |computer|
      result = computer.domain
      break
    end
    result
  end
end
