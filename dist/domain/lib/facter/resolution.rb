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
    `wmic path win32_videocontroller get name /format:value`.each_line do |l|
      if l =~ /=/
        name, value = l.split('=')
        monitor = value.to_s.chomp
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

Facter.add(:maxres) do
  confine :operatingsystem => :windows

  setcode do
    screen = []
    `c:/itc/bin/dumpedid.exe`.each_line do |l|
    if l =~ /Maximum Resolution/
      label, value = l.split(':')
      maxx, maxy = value.split('X')
      screen << maxx.chomp.to_i
      screen << maxxy.chomp.to_i
    end
    result = screen
  end

end
