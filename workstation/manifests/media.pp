class workstation::media {
  package { [ 'gimp', 'evince', 'ffmpeg', 'mplayer', 'geeqie', 'vlc', 'mencoder', 'firefox' ]:
    ensure   =>  installed,
    provider =>  'pacman'
  }
  package { 'google-chrome':
    ensure   =>  installed,
  }
}
