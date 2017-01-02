class workstation::common {
  case $hostname {
    'jupiter':  { $link = '/var/backups/dw' }
    'mercury':  { $link = '/home/ernestas/.disk/dw' }
    default:    { $link = '/home/ernestas/dw' }
  }
  if $link == '/home/ernestas/dw' {
    file { '/home/ernestas/dw':
      ensure  =>  directory,
      mode    =>  '755',
      owner   =>  'ernestas',
      group   =>  'ernestas',
      before  =>  File['/home/ernestas/dw/session']
    }
  } else {
    file { '/home/ernestas/dw':
      ensure  =>  link,
      target  =>  $link,
      owner   =>  'ernestas',
      group   =>  'ernestas',
      before  =>  File['/home/ernestas/dw/session']
    }
  } 
  file { '/etc/systemd/system/docker.service':
    before =>  Service['docker'],
    source  =>  'puppet:///modules/workstation/etc-systemd-system-docker_service',
    owner   =>  'root',
    group   =>  'root',
    mode    =>  '644',
    notify  =>  Service['docker']
  }
  file { '/home/ernestas/dw/session':
    ensure  =>  directory,
    owner   =>  'ernestas',
    group   =>  'ernestas',
    mode    =>  '755',
    require =>  File['/home/ernestas/dw']
  }
  service { 'docker':
    require =>  Package['docker'],
    ensure  =>  running,
    enable  =>  true
  }
  file { '/etc/systemd/system/rtorrent.service':
    before =>  Service['rtorrent'],
    source  =>  'puppet:///modules/workstation/etc-systemd-system-rtorrent_service',
    owner   =>  'root',
    group   =>  'root',
    mode    =>  '644',
    notify  =>  Service['rtorrent']
  }
  service { 'rtorrent':
    require =>  [ Package['rtorrent'], Package['screen'] ],
    ensure  =>  running,
    enable  =>  true
  }
  file { '/home/ernestas/.rtorrent.rc':
    source  =>  'puppet:///modules/workstation/home-ernestas-_rtorrent_rc',
    owner   =>  'ernestas',
    group   =>  'ernestas',
    mode    =>  '644'
  }
  user { 'ernestas':
    shell      =>  '/bin/bash',
    allowdupe  =>  no,
    managehome =>  true,
  }
  file { "/etc/sudoers.d/ernestas":
    mode    =>  '440',
    owner   =>  'root',
    group   =>  'root',
    source  =>  'puppet:///modules/workstation/etc-sudoers_d-ernestas',
  }

  exec { 'enable ntp':
    command  =>  '/usr/bin/timedatectl set-ntp true',
    onlyif   =>  '/usr/bin/timedatectl status | grep NTP | grep -q no'
  }
  file { '/etc/pacman.d/mirrorlist':
    source  =>  'puppet:///modules/workstation/etc-pacman_d-mirrorlist',
    notify  =>  Exec['pacman update']
  }
  file { '/etc/pacman.conf':
    source  =>  'puppet:///modules/workstation/etc-pacman_conf',
    notify  =>  Exec['pacman update']
  }
  exec { 'pacman update':
    command =>  '/usr/bin/pacman -Syu --noconfirm --noprogressbar --force',
    user    =>  'root',
    refreshonly => true
  }
  $packages = [
    'autoconf',
    'automake',
    'binutils',
    'file',
    'findutils',
    'flex',
    'gawk',
    'gettext',
    'groff',
    'gzip',
    'libtool',
    'make',
    'pkg-config',
    'sudo',
    'texinfo',
    'util-linux',
    'which',
    'htop',
    'iotop',
    'vnstat',
    'iftop',
    'git',
    'xz',
    'nano',
    'docker',
    'openvpn',
    'openssh',
    'irssi',
    'screen',
    'tmux',
    'wget',
    'curl',
    'python',
    'ruby',
    'gcc-go',
    'rsync',
    'borg',
    'ncurses',
    'jre8-openjdk',
    'jdk8-openjdk',
    'imagemagick',
    'samba',
    'smbclient',
    'openssl',
    'rsnapshot',
    'gnupg',
    'fuse2',
    'logrotate',
    'man-pages',
    'acpid',
    'unrar',
    'zip',
    'unzip',
    'diffutils',
    'at',
    'fcgi',
    'dhcpcd',
    'ark',
    'wireshark-cli',
    'wpa_supplicant',
    'python-requests',
    'mercurial',
    'coreutils',
    'whois',
    'readline',
    'gnutls',
    'mutt',
    'vim',
    'vim-runtime',
    'linux-firmware',
    'mc',
    'ipmitool',
    'hdparm',
    'smartmontools',
    'ncdu',
    'dkms',
    'tar',
    'tcpdump',
    'gcc',
    'rtorrent',
    'fakeroot',
    'sed',
    'grep',
    'm4',
    'dosfstools',
    'ntfs-3g',
    'mdadm',
    'vi',
    'lsof',
    'patch',
    'lzo',
    'java-environment-common',
    'java-runtime-common',
    'imake',
    'acpi',
    'bzip2',
    'rfkill',
    'pm-utils',
  ]
  package { $packages:
    ensure   =>  installed,
    provider =>  'pacman'
  }
  Package {
    require   =>  [ Exec['pacman update'], File['/etc/pacman.conf'], File['/etc/pacman.d/mirrorlist'] ]
  }
}
