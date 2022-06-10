project('elementary-session-settings',
        version: '5.0.3',
        default_options: 'sysconfdir=/etc')

prefix = get_option('prefix')
datadir = join_paths(prefix, get_option('datadir'))

if get_option('mimeapps-list')
    subdir('applications')
endif

subdir('session')
subdir('xsessions')

if get_option('systemd')
    subdir('systemd')
endif
