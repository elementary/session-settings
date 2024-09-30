project('elementary-session-settings',
        version: '8.0.1',
        default_options: 'sysconfdir=/etc')

i18n = import('i18n')
prefix = get_option('prefix')
datadir = join_paths(prefix, get_option('datadir'))

gsd_dep = dependency('gnome-settings-daemon', version: '>= 3.36.0')

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
    'org.gnome.SettingsDaemon.ScreensaverProxy',
    'org.gnome.SettingsDaemon.Sharing',
    'org.gnome.SettingsDaemon.Smartcard',
    'org.gnome.SettingsDaemon.Sound',
    'org.gnome.SettingsDaemon.UsbProtection',
    'org.gnome.SettingsDaemon.Wacom',
    'org.gnome.SettingsDaemon.XSettings',
]

subdir('po')

if get_option('mimeapps-list')
    subdir('applications')
endif

subdir('session')
subdir('xsessions')

if get_option('systemd')
    subdir('systemd')
endif

if get_option('wayland')
    subdir('wayland-sessions')
endif
