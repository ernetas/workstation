class workstation::media {
  package { [ 'gimp', 'evince', 'ffmpeg', 'mplayer', 'geeqie', 'vlc', 'mencoder', 'firefox' ]:
    ensure  =>  installed
  }
  package { 'google-chrome':
    ensure   =>  installed,
    provider =>  'yaourt'
  }
}
