# Stock Debian (x64) optimisations
# Script can be called by :
# eval "$(wget -qO- https://raw.githubusercontent.com/kina-mpo/debian/main/optimisation.sh)"

# Deleting unnecessary packages
apt autoremove --purge apparmor* aspell* aspell-fr* busybox* bzip2* console-setup* console-setup-linux* debian-faq* dictionaries-common* discover* discover-data* emacsen-common* ifrench-gut* ispell* libaspell15* libcurl3-gnutls* libdiscover2* libusb-0.1-4* openssl* python3-certifi* python3-chardet* python3-debian* python3-debianbts* python3-httplib2* python3-idna* python3-pkg-resources* python3-pycurl* python3-pysimplesoap* python3-reportbug* python3-requests* python3-six* python3-urllib3* reportbug* wfrench* xkb-data* apt-listchanges* distro-info-data* doc-debian* gir1.2-glib-2.0* iso-codes* libgirepository-1.0-1* libglib2.0-0* libglib2.0-data* libmpdec3* libpython3-stdlib* libpython3.9-minimal* libpython3.9-stdlib* lsb-release* python-apt-common* python3* python3-apt* python3-dbus* python3-debconf* python3-distro-info* python3-gi* python3-minimal* python3.9* python3.9-minimal* shared-mime-info* unattended-upgrades* xdg-user-dirs* groff-base* libpipeline1* libuchardet0* man-db* installation-report* installation-report* laptop-detect* logrotate* manpages* manpages-fr* nano* mailcap* media-types* mime-support* os-prober* libgdbm-compat4* libgdbm6* libperl5.32* perl-modules-5.32* dirmngr* libassuan0* libksba8* libnpth0* libreadline8* libsqlite3-0* pinentry-curses* readline-common* rsyslog* wamerican* whiptail* liblognorm5* libnewt0.52* libpopt0* debconf-i18n*

# Deleting unnecessary files
rm -rf /var/cache/apt
rm -rf /usr/share/doc
rm -rf /usr/share/man

# charmaps and locales : french config
mv /usr/share/i18n/charmaps/UTF-8.gz /tmp/
mv /usr/share/i18n/locales/fr_FR /tmp/
mv /usr/share/i18n/locales/iso14651_t1 /tmp/
rm -f /usr/share/i18n/charmaps/*
rm -f /usr/share/i18n/locales/*
echo "fr_FR.UTF-8 UTF-8" > /usr/share/i18n/SUPPORTED
mv /tmp/UTF-8.gz /usr/share/i18n/charmaps/
mv /tmp/fr_FR /usr/share/i18n/locales/
mv /tmp/iso14651_t1 /usr/share/i18n/locales/

# Deleting manpages, package has already been removed before
rm -rf /usr/share/man

# Reduce the size of the initramfs
echo "COMPRESS=xz" > /etc/initramfs-tools/conf.d/compress

# Remove unnecessary ipv6 files
rm -f /lib/xtables/libip6*.so

# Disabling hibernation
rm /etc/initramfs-tools/conf.d/resume
update-initramfs -u
