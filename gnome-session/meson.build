fallback_session = get_option('fallback-session')

session_configuration = configuration_data()
session_configuration.set('FALLBACK_SESSION', fallback_session)

pantheon_session = configure_file(
  input: 'pantheon.session.in',
  output: '@BASENAME@',
  configuration: session_configuration,
  install_dir: join_paths(datadir, 'gnome-session', 'sessions')
)
