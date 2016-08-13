Facter.add(:currentres) do
  confine :operatingsystem => :windows

  setcode do
    screen = []
    `wmic desktopmonitor get screenwidth /format:value`.each_line do |l|
      if l =~ /=/
        name, value = l.split('=')
        screen << value.to_i
      end
    end
    `wmic desktopmonitor get screenheight /format:value`.each_line do |l|
      if l =~ /=/
        name, value = l.split('=')
        screen << value.to_i
      end
    end
    result = screen
  end

end

Facter.add(:maxres) do
  confine :operatingsystem => :windows

  setcode do
    screen, output = []
    `c:/itc/bin/changescreenresolution.exe /m /d=0`.each_line do |l|
      if l =~ /default/
        output << l
      end
    end
    output.sort
    res, depth, freq = output.last.split
    x, y = res.split('x')
    screen << x.to_i << y.to_i
    screen << depth.sub('bit','').to_i
    screen << freq.sub('@','').sub('Hz','').to_i
    result = screen
  end

end

Facter.add(:graphics) do
  confine :operatingsystem => :windows

  setcode do
    gfx = "unknown"
    `c:/itc/bin/changescreenresolution.exe /l /d=0`.each_line do |l|
      if l =~ /\[0\]/
        gfx = l.reverse[0...-18].reverse.strip
      end
    end
    result = gfx
  end

end

Facter.add(:monitor) do
  confine :operatingsystem => :windows

  setcode do
    monitor = "unknown"
    `c:/itc/bin/changescreenresolution.exe /l /d=0`.each_line do |l|
      if l =~ /Monitor0/
        monitor = l.reverse[0...-27].reverse.strip
      end
    end
    result = monitor
  end

end
