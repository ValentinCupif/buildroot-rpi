#############################################################
#
# clutter
#
#############################################################

CLUTTER_VERSION = 1.14.4
CLUTTER_SITE = http://ftp.gnome.org/pub/GNOME/sources/clutter/1.14/
CLUTTER_SOURCE=clutter-$(CLUTTER_VERSION).tar.xz

CLUTTER_DEPENDENCIES = cogl json-glib atk wayland gdk-pixbuf libxkbcommon gdk-pixbuf

CLUTTER_AUTORECONF = yes

CLUTTER_CONF_OPT =  \
	--enable-x11-backend=no \
	--enable-win32-backend=no \
	--enable-quartz-backend=no \
	--enable-gdk-backend=no \
	--enable-wayland-backend=yes \
	--enable-cex100-backend=no \
	--enable-wayland-compositor=yes \
	--enable-tslib-input=no \
	--enable-evdev-input=no \
	--enable-xinput=no \
	--enable-gdk-pixbuf=no \
	--enable-egl-backend=no \
	--includedir=$(STAGING_DIR)/gdk-pixbuf-2.0/ \
	--disable-examples \
	--disable-tests


$(eval $(autotools-package))
