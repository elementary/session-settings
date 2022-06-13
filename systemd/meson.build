dep_systemd = dependency('systemd', required: true)
systemd_userunitdir = get_option('systemduserunitdir')
if systemd_userunitdir == ''
    systemd_userunitdir = dep_systemd.get_pkgconfig_variable('systemduserunitdir', define_variable: ['prefix', get_option('prefix')])
endif

install_data(
    'gnome-session-x11@pantheon.target',
    install_dir: systemd_userunitdir
)

install_data(
    'pantheon-session-x11.target',
    install_dir: systemd_userunitdir
)
