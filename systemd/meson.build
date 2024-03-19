dep_systemd = dependency('systemd', required: true)
systemd_userunitdir = get_option('systemduserunitdir')
if systemd_userunitdir == ''
    systemd_userunitdir = dep_systemd.get_pkgconfig_variable('systemduserunitdir', define_variable: ['prefix', get_option('prefix')])
endif

desktop_plain = 'pantheon'

shell_component = {
    desktop_plain: 'io.elementary.gala',
}

required_components = {
    desktop_plain: gsd_components,
}

gnome_session_wanted_targets = []
foreach component: required_components[desktop_plain]
    gnome_session_wanted_targets += 'Wants=@0@.target'.format(component)
endforeach

configure_file(
    input: 'gnome.session.conf.in',
    output: 'session.conf',
    configuration: {
        'requires_component': shell_component[desktop_plain],
        'wants_required_components': '\n'.join(gnome_session_wanted_targets),
    },
    install_dir: systemd_userunitdir / 'gnome-session@pantheon.target.d',
)
