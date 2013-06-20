#############################################################
#
# clutter
#
#############################################################

CLUTTER_VERSION = 1.14.4
CLUTTER_SITE = http://ftp.gnome.org/pub/GNOME/sources/clutter/1.14/
CLUTTER_SOURCE=clutter-$(CLUTTER_VERSION).tar.xz

CLUTTER_DEPENDENCIES = cogl cairo atk pango json-glib 

# CLUTTER_REQUIRES="$CLUTTER_BASE_PC_FILES $BACKEND_PC_FILES"

# CLUTTER_BASE_PC_FILES="cogl-1.0 >= $COGL_REQ_VERSION cairo-gobject >= $CAIRO_REQ_VERSION atk >= $ATK_REQ_VERSION pangocairo >= $PANGO_REQ_VERSION cogl-pango-1.0 json-glib-1.0 >= $JSON_GLIB_REQ_VERSION"

# COGL_REQ_VERSION=1.14.0
# CAIRO_REQ_VERSION=1.10
# ATK_REQ_VERSION=2.5.3
# PANGO_REQ_VERSION=1.30
# JSON_GLIB_REQ_VERSION=0.12.0

# BACKEND_PC_FILES=pangoft2 gdk-3.0 wayland-cursor wayland-client xkbcommon gdk-pixbuf-2.0 wayland-server gudev-1.0 xkbcommon

# object-introspection-1.0 >= 0.9.5
# glib-2.0 >= 2.10.0
# tslib-1.0
# pangoft2 
# gdk-3.0 >= 3.3.18
# uprof-0.3
# gobject-2.0  >= 2.10.0

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
	--disable-examples \
	--disable-tests

ifeq ($(BR2_PACKAGE_WAYLAND), y)
CLUTTER_DEPENDENCIES += gdk-pixbuf
CLUTTER_CONF_OPT += --includedir=$(STAGING_DIR)/gdk-pixbuf-2.0/
endif

$(eval $(autotools-package))
