install_data(
    'cerbere.desktop',
    install_dir: join_paths(get_option('datadir'), 'pantheon')
)

patched_gsd325_autostarts = [
    'org.gnome.SettingsDaemon.A11yKeyboard-pantheon.desktop',
    'org.gnome.SettingsDaemon.A11ySettings-pantheon.desktop',
    'org.gnome.SettingsDaemon.Clipboard-pantheon.desktop',
    'org.gnome.SettingsDaemon.Color-pantheon.desktop',
    'org.gnome.SettingsDaemon.Datetime-pantheon.desktop',
    'org.gnome.SettingsDaemon.DiskUtilityNotify-pantheon.desktop',
    'org.gnome.SettingsDaemon.Housekeeping-pantheon.desktop',
    'org.gnome.SettingsDaemon.Keyboard-pantheon.desktop',
    'org.gnome.SettingsDaemon.MediaKeys-pantheon.desktop',
    'org.gnome.SettingsDaemon.Mouse-pantheon.desktop',
    'org.gnome.SettingsDaemon.Orientation-pantheon.desktop',
    'org.gnome.SettingsDaemon.Power-pantheon.desktop',
    'org.gnome.SettingsDaemon.PrintNotifications-pantheon.desktop',
    'org.gnome.SettingsDaemon.Rfkill-pantheon.desktop',
    'org.gnome.SettingsDaemon.ScreensaverProxy-pantheon.desktop',
    'org.gnome.SettingsDaemon.Sharing-pantheon.desktop',
    'org.gnome.SettingsDaemon.Smartcard-pantheon.desktop',
    'org.gnome.SettingsDaemon.Sound-pantheon.desktop',
    'org.gnome.SettingsDaemon.Wacom-pantheon.desktop',
    'org.gnome.SettingsDaemon.XRANDR-pantheon.desktop',
    'org.gnome.SettingsDaemon.XSettings-pantheon.desktop'

]

if get_option('with-patched-gsd325-autostarts') == true
    install_data(
        patched_gsd325_autostarts,
        install_dir: join_paths(get_option('sysconfdir'), 'xdg', 'autostart')
    )
endif

patched_ubuntu_autostarts = [
    'gnome-keyring-gpg-pantheon.desktop',
    'gnome-keyring-pkcs11-pantheon.desktop',
    'gnome-keyring-secrets-pantheon.desktop',
    'gnome-keyring-ssh-pantheon.desktop',
    'gnome-user-share-pantheon.desktop',
    'onboard-autostart-pantheon.desktop',
    'orca-autostart-pantheon.desktop',
    'user-dirs-update-gtk-pantheon.desktop'
]

if get_option('with-patched-ubuntu-autostarts') == true
    install_data(
        patched_ubuntu_autostarts,
        install_dir: join_paths(get_option('sysconfdir'), 'xdg', 'autostart')
    )
endif
