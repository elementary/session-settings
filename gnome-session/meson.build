fallback_session = get_option('fallback-session')

session_configuration = configuration_data()
session_configuration.set('FALLBACK_SESSION', fallback_session)

pantheon_components = [
  'gala',
  'gala-daemon',
]

gsd_components = [
  'org.gnome.SettingsDaemon.A11ySettings',
  'org.gnome.SettingsDaemon.Color',
  'org.gnome.SettingsDaemon.Datetime',
  'org.gnome.SettingsDaemon.Housekeeping',
  'org.gnome.SettingsDaemon.Keyboard',
  'org.gnome.SettingsDaemon.MediaKeys',
  'org.gnome.SettingsDaemon.Power',
  'org.gnome.SettingsDaemon.PrintNotifications',
  'org.gnome.SettingsDaemon.Rfkill',
  'org.gnome.SettingsDaemon.Sharing',
  'org.gnome.SettingsDaemon.Smartcard',
  'org.gnome.SettingsDaemon.Sound',
  'org.gnome.SettingsDaemon.Wacom',
  'org.gnome.SettingsDaemon.XSettings',
]

# Removed in 3.33.90
# https://gitlab.gnome.org/GNOME/gnome-session/-/commit/863ff3c8e3a64ef6dc6ecd0c243699b598484b44
# https://gitlab.gnome.org/GNOME/gnome-session/-/commit/01f27ed6e501bfd66a7e725a1ca1b452f52fcf07
gsd_mouse_clipboard = [
  'org.gnome.SettingsDaemon.Clipboard',
  'org.gnome.SettingsDaemon.Mouse',
]

# Added in 3.36.0
# https://gitlab.gnome.org/GNOME/gnome-session/-/commit/86d4132c7810b5c1b2392f63c15b3b90b8a7a4f9
gsd_usb_protection = ['org.gnome.SettingsDaemon.UsbProtection']

# Needs a minimum 3.28 GNOME stack
gsd_minimum_version = '>= 3.27.90'

gsd_dep = dependency('gnome-settings-daemon', version: gsd_minimum_version)
gsd_version = gsd_dep.version()

# Merge the list depending on the gnome-settings-daemon version.
if gsd_version.version_compare('>=3.36.0')
  session_components = pantheon_components + gsd_components + gsd_usb_protection
elif gsd_version.version_compare('>=3.33.90')
  session_components = pantheon_components + gsd_components
else
  session_components = pantheon_components + gsd_components + gsd_mouse_clipboard
endif

session_configuration.set('SESSION_COMPONENTS', ';'.join(session_components))

pantheon_session = configure_file(
  input: 'pantheon.session.in',
  output: '@BASENAME@',
  configuration: session_configuration,
  install_dir: join_paths(datadir, 'gnome-session', 'sessions')
)
