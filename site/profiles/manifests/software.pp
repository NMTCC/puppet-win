# Class  profiles::software
#
#
#

class profiles::software {

  include profiles::software::chocolatey
#  include profiles::software::biochemlab
  include profiles::software::nanomodeling
  include profiles::software::petromod
#  include profiles::software::blueview
  include profiles::software::mathaddin
#  include profiles::software::lanschool
  include profiles::software::delprof2
  include profiles::software::comsol
  include profiles::software::solidworks
#  include profiles::software::sas
#  include profiles::software::adobe
  include profiles::software::java
  include profiles::software::labview
  include profiles::software::itc

}
