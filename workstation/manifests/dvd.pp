class workstation::dvd {
  package { [ 'k3b', 'brasero', 'dvd+rw-tools' ]:
    ensure    =>  installed,
    provider  =>  'pacman'
  }
}
