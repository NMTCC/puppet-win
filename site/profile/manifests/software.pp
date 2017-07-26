# Configure software packages
class profile::software {

  include profile::software::chocolatey
  include profile::software::comsol
  include profile::software::delprof2
  include profile::software::java
  include profile::software::labview
  include profile::software::petromod
  include profile::software::solidworks
  
}
