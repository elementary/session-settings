fallback_session = get_option('fallback-session')

session_configuration = configuration_data()
session_configuration.set('FALLBACK_SESSION', fallback_session)

session_components = [
  'gala',
  gsd_components
]

session_configuration.set('SESSION_COMPONENTS', ';'.join(session_components))

pantheon_session = configure_file(
  input: 'pantheon.session.in',
  output: '@BASENAME@',
  configuration: session_configuration,
  install_dir: join_paths(datadir, 'gnome-session', 'sessions')
)

if get_option('wayland')
    wayland_session_components = [
      'gala-wayland',
      gsd_components
    ]

    wayland_session_configuration = configuration_data()
    wayland_session_configuration.set('SESSION_COMPONENTS', ';'.join(wayland_session_components))

    configure_file(
      input: 'pantheon-wayland.session.in',
      output: '@BASENAME@',
      configuration: wayland_session_configuration,
      install_dir: datadir / 'gnome-session' / 'sessions'
    )
endif

autostartdir = join_paths(get_option('sysconfdir'), 'xdg', 'autostart')

gsd_dir = gsd_dep.get_pkgconfig_variable('prefix')
desktop_file_install = find_program('desktop-file-install')

foreach component : gsd_components
  original_filename = component + '.desktop'

  if get_option('detect-program-prefixes') == true
    original_autostart_file = join_paths(gsd_dir, 'etc/xdg/autostart', original_filename)
  else
    original_autostart_file = join_paths(autostartdir, original_filename)
  endif

  patched_filename = 'pantheon-' + component + '.desktop'

  custom_target('create-gsd-autostart' + patched_filename,
    input: original_autostart_file,
    output: patched_filename,
    command: [
      desktop_file_install,
      '--set-key=OnlyShowIn',
      '--set-value=Pantheon',
      '--vendor=pantheon',
      '--dir=@OUTDIR@',
      '@INPUT@',
    ],
    install: true,
    install_dir: autostartdir,
  )
endforeach

gnome_keyring = find_program('gnome-keyring-daemon')
orca = find_program('orca')

if get_option('detect-program-prefixes') == true
  # TODO: use fs module in meson 0.53.0
  gnome_keyring_prefix = gnome_keyring.path().split('/bin')[0]
  orca_prefix = orca.path().split('/bin')[0]

  autostarts = {
    'gnome-keyring-pkcs11': join_paths(gnome_keyring_prefix, 'etc/xdg/autostart', 'gnome-keyring-pkcs11.desktop'),
    'gnome-keyring-secrets': join_paths(gnome_keyring_prefix, 'etc/xdg/autostart', 'gnome-keyring-secrets.desktop'),
    'gnome-keyring-ssh': join_paths(gnome_keyring_prefix, 'etc/xdg/autostart', 'gnome-keyring-ssh.desktop'),
    'orca-autostart': join_paths(orca_prefix, 'etc/xdg/autostart', 'orca-autostart.desktop'),
  }
else
  autostarts = {
    'gnome-keyring-pkcs11': join_paths(autostartdir, 'gnome-keyring-pkcs11.desktop'),
    'gnome-keyring-secrets': join_paths(autostartdir, 'gnome-keyring-secrets.desktop'),
    'gnome-keyring-ssh': join_paths(autostartdir, 'gnome-keyring-ssh.desktop'),
    'orca-autostart': join_paths(autostartdir, 'orca-autostart.desktop'),
  }
endif

foreach name, autostart : autostarts
  custom_target('create-autostart-' + name,
    input: autostart,
    output: 'pantheon-' + name + '.desktop',
    command: [
      desktop_file_install,
      '--set-key=OnlyShowIn',
      '--set-value=Pantheon',
      '--vendor=pantheon',
      '--dir=@OUTDIR@',
      '@INPUT@',
    ],
    install: true,
    install_dir: autostartdir,
  )
endforeach
