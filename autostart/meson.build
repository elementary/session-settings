autostartdir = join_paths(get_option('sysconfdir'), 'xdg', 'autostart')

if get_option('patched-gsd-autostarts')
    install_subdir(
        'gsd',
        install_dir: autostartdir,
        strip_directory: true
    )
endif


if get_option('patched-ubuntu-autostarts')
    install_subdir(
        'ubuntu',
        install_dir: autostartdir,
        strip_directory: true
    )
endif

install_subdir(
    'light-locker',
    install_dir: autostartdir,
    strip_directory: true
)
