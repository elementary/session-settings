dep_systemd = dependency('systemd', required: true)
systemd_userunitdir = dep_systemd.get_pkgconfig_variable('systemduserunitdir')

install_data(
    'gnome-session-x11@pantheon.target',
    install_dir: systemd_userunitdir
)

install_data(
    'pantheon-session-x11.target',
    install_dir: systemd_userunitdir
)
