# Class  profiles::software
#
#
#

class profiles::software {

  include profiles::software::chocolatey
  include profiles::software::biochemlab
  include profiles::software::nanomodeling
  include profiles::software::petromod

}
