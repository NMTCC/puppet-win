Facter.add(:queuecount) do
  confine :operatingsystem => :windows
  setcode do
    require 'win32ole'
    result = 0
    wmi = WIN32OLE.connect('winmgmts://./root/CIMV2')
    query = wmi.ExecQuery('Select * from Win32_Printer')
    query.each do |queue|
      if(queue.systemname == '\\paperhost')
        result += 1
      end
    end
    result.to_s
  end
end
