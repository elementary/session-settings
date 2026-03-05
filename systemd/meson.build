dep_systemd = dependency('systemd', required: true)
systemd_userunitdir = get_option('systemduserunitdir')
if systemd_userunitdir == ''
    systemd_userunitdir = dep_systemd.get_pkgconfig_variable('systemduserunitdir', define_variable: ['prefix', get_option('prefix')])
endif

desktop_targets = 'targets'
desktop_sockets = 'sockets'
desktop_services = 'services'

shell_component = {
    desktop_targets: 'io.elementary.gala',
}

required_components = {
    desktop_targets: gsd_components,
    desktop_sockets: keyring_components,
    desktop_services: desktop_components
}

gnome_session_wanted_targets = []
gnome_session_wanted_sockets = []
gnome_session_wanted_services = []
foreach component: required_components[desktop_targets]
    gnome_session_wanted_targets += 'Wants=@0@.target'.format(component)
endforeach
foreach component: required_components[desktop_sockets]
    gnome_session_wanted_sockets += 'Wants=@0@.socket'.format(component)
endforeach
foreach component: required_components[desktop_services]
    gnome_session_wanted_services += 'Wants=@0@.service'.format(component)
endforeach

session_config = configure_file(
    input: 'gnome.session.conf.in',
    output: 'session.conf',
    configuration: {
        'requires_component': shell_component[desktop_targets],
        'wants_required_components': '\n'.join(gnome_session_wanted_targets, gnome_session_wanted_sockets, gnome_session_wanted_services),
    },
    install_dir: systemd_userunitdir / 'gnome-session@pantheon.target.d',
)

install_data(
    session_config,
    install_dir: systemd_userunitdir / 'gnome-session@pantheon-wayland.target.d',
)
