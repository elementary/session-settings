project('elementary-session-settings',
        default_options: 'sysconfdir=/etc')

if get_option('with-defaults-list') == true
    subdir('applications')
endif

subdir('autostart')

subdir('gnome-session')

if get_option('with-unity-greeter-badge') == true
    subdir('unity-greeter')
endif

if get_option('with-wayland') == true
    subdir('wayland-sessions')
endif

if get_option('with-x') == true
    subdir('xsessions')
endif
