if get_option('with-x') == true
    install_data(
        'pantheon.session',
        install_dir: join_paths(get_option('datadir'), 'gnome-session', 'sessions')
    )
endif

if get_option('with-wayland') == true
    install_data(
        'pantheon-wayland.session',
        install_dir: join_paths(get_option('datadir'), 'gnome-session', 'sessions')
    )
endif
