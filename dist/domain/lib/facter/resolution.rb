Facter.add(:currentres) do
  confine :operatingsystem => :windows

  setcode do
    result = []
    `wmic desktopmonitor get screenwidth /format:value`.each_line do |l|
      if l =~ /=/
        name, value = l.split('=')
        result << value.to_i
      end
    end
    `wmic desktopmonitor get screenheight /format:value`.each_line do |l|
      if l =~ /=/
        name, value = l.split('=')
        result << value.to_i
      end
    end
  end

end

Facter.add(:maxres) do
  confine :operatingsystem => :windows

  setcode do
    result, output = []
    `c:/itc/bin/changescreenresolution.exe /m /d=0`.each_line do |l|
      if l =~ /default/
        output << l
      end
    end
    output.sort
    res, depth, freq = output.last.split
    x, y = res.split('x')
    result << x.to_i << y.to_i
    result << depth.sub('bit','').to_i
    result << freq.sub('@','').sub('Hz','').to_i
  end

end

Facter.add(:graphics) do
  confine :operatingsystem => :windows

  setcode do
    result = "unknown"
    `c:/itc/bin/changescreenresolution.exe /l /d=0`.each_line do |l|
      if l =~ /\[0\]/
        result = l.reverse[0...-18].reverse.strip
      end
    end
  end

end

Facter.add(:monitor) do
  confine :operatingsystem => :windows

  setcode do
    result = "unknown"
    `c:/itc/bin/changescreenresolution.exe /l /d=0`.each_line do |l|
      if l =~ /Monitor0/
        puts l.reverse[0...-27].reverse.strip
      end
    end
  end

end
