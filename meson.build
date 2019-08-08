project('elementary-session-settings',
        version: '5.0.3',
        default_options: 'sysconfdir=/etc')

prefix = get_option('prefix')
datadir = join_paths(prefix, get_option('datadir'))

if get_option('defaults-list')
    subdir('applications')
endif

subdir('autostart')
subdir('gnome-session')
subdir('xsessions')
