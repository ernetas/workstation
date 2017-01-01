class workstation::desktop {
  include '::workstation::dvd'
  include '::workstation::media'
  $packages = [
    'fluxbox',
    'xterm',
    'insync',
    'abiword',
    'libreoffice-fresh',
    'keepassx2',
    'mesa',
    'rdesktop',
    'networkmanager',
    'networkmanager-openvpn',
    'pidgin',
    'xchat',
    'redshift',
    'thunderbird',
    'libreoffice-fresh-lt',
    'xlockmore',
    'qbat',
    'gparted',
    'dropbox',
    'pulseaudio-bluetooth',
    'pulseaudio',
    'blueman',
    'qemu',
    'packer-io',
    'alsa-utils',
    'pavucontrol',
    'xorg-server-xvfb',
    'virtualbox',
    'virtualbox-host-dkms',
    'opera',
    'slack-desktop',
    'gvfs',
    'kdenlive',
    'krusader',
    'dolphin',
    'nautilus',
    'gwenview',
    'oxygen-icons',
    'flashplugin',
    'virt-viewer',
    'udisks2',
    'vagrant',
    'xf86-video-intel',
    'pango',
    'youtube-dl',
    'wireshark-gtk',
    'gstreamer0.10-bad',
    'gstreamer0.10-bad-plugins',
    'filezilla',
    'baobab',
    'feh',
    'vinagre',
    'gnome-keyring',
    'cups',
    'mono',
    'transmission-gtk',
    'gstreamer0.10-good',
    'gstreamer0.10-good-plugins',
    'putty',
    'aspell',
    'xorg-xinit',
    'xorg-xinput',
    'cairo-ubuntu',
    'xorg-xvinfo',
    'xorg-xev',
    'sublime-text',
    'xorg-iceauth',
    'scrot',
    'sysfsutils',
    'numlockx',
    'xorg-xauth',
    

  ]
  package { $packages:
    ensure  =>  installed
  }
}