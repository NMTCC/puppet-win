class profiles::software::lanschool {

  case $::hostname {
    /^SPEARE4A/, /^SPEARE4B/: {
      package { 'LanSchool Student':
        ensure          => installed,
        source          => 'C:\\itc\downloads\LanSchool\Student.msi',
        install_options => ['/qn', 'CHANNEL=4'],
      }
    }
    /^SPEARE4-INST$/: {
      package { 'LanSchool Teacher':
        ensure          => installed,
        source          => 'C:\\itc\downloads\LanSchool\Teacher.msi',
        install_options => ['/qn', 'CHANNEL=4'],
      }
    }
    /^SPEARE23A/, /^SPEARE23B/: {
      package { 'LanSchool Student':
        ensure          => installed,
        source          => 'C:\\itc\downloads\LanSchool\Student.msi',
        install_options => ['/qn', 'CHANNEL=23'],
      }
    }
    /^SPEARE116-[0-9]-[0-9]$/: {
      package { 'LanSchool Student':
        ensure          => installed,
        source          => 'C:\\itc\downloads\LanSchool\Student.msi',
        install_options => ['/qn', 'CHANNEL=116'],
      }
    }
    /^SPEARE116-INST$/: {
      package { 'LanSchool Teacher':
        ensure          => installed,
        source          => 'C:\\itc\downloads\LanSchool\Teacher.msi',
        install_options => ['/qn', 'CHANNEL=116'],
      }
    }
    /^MSEC187-[0-9]-[0-9]$/: {
      package { 'LanSchool Student':
        ensure          => installed,
        source          => 'C:\\itc\downloads\LanSchool\Student.msi',
        install_options => ['/qn', 'CHANNEL=187'],
      }
    }
    /^MSEC187-INST$/: {
      package { 'LanSchool Teacher':
        ensure          => installed,
        source          => 'C:\\itc\downloads\LanSchool\Teacher.msi',
        install_options => ['/qn', 'CHANNEL=187'],
      }
    }
    /^WEIR128-[0-9]-[0-9]$/: {
      package { 'LanSchool Student':
        ensure          => installed,
        source          => 'C:\\itc\downloads\LanSchool\Student.msi',
        install_options => ['/qn', 'CHANNEL=128'],
      }
    }
    /^WEIR128-INST$/: {
      package { 'LanSchool Teacher':
        ensure          => installed,
        source          => 'C:\\itc\downloads\LanSchool\Teacher.msi',
        install_options => ['/qn', 'CHANNEL=128'],
      }
    }
    /^WEIR209-[0-9]-[0-9]$/: {
      package { 'LanSchool Student':
        ensure          => installed,
        source          => 'C:\\itc\downloads\LanSchool\Student.msi',
        install_options => ['/qn', 'CHANNEL=209'],
      }
    }
    /^WEIR209-INST$/: {
      package { 'LanSchool Teacher':
        ensure          => installed,
        source          => 'C:\\itc\downloads\LanSchool\Teacher.msi',
        install_options => ['/qn', 'CHANNEL=209'],
      }
    }
    default: {
      $dummy = [ 'Did not install LanSchool.', ]
    }
  }

}
