#############################################################
#
# cogl
#
#############################################################

COGL_VERSION = 1.12.2
COGL_SITE = http://ftp.gnome.org/pub/GNOME/sources/cogl/1.12/
COGL_SOURCE=cogl-$(COGL_VERSION).tar.xz

COGL_DEPENDENCIES = libglib2

COGL_CONF_OPT =  \
	--enable-gles1=no \
	--enable-gles2=yes \
	--enable-glx=no \
	--enable-gl=no \
	--enable-wgl=no \
	--enable-gdl-egl-platform=yes \
	--enable-xlib-egl-platform=no \
	--enable-gtk-doc-html=no \
	--enable-cairo=no \
	--enable-cogl-pango=no \
	--enable-gdl-egl-platform=no

$(eval $(autotools-package))
