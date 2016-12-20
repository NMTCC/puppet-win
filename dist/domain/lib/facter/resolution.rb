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

Facter.add(:pixelsperinch) do
  confine :operatingsystem => :windows

  setcode do
    ppi = []
    `wmic desktopmonitor get pixelsperxlogicalinch /format:value`.each_line do |l|
      if l =~ /=/
        name, value = l.split('=')
        ppi << value.to_i
      end
    end
    `wmic desktopmonitor get pixelsperylogicalinch /format:value`.each_line do |l|
      if l =~ /=/
        name, value = l.split('=')
        ppi << value.to_i
      end
    end
    result = ppi
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
    `wmic desktopmonitor get name /format:value`.each_line do |l|
      if l =~ /=/
        name, value = l.split('=')
        monitor = value.to_s.chomp
      end
    end
    result = monitor
  end

end
