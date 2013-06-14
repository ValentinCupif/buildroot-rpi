#############################################################
#
# cogl
#
#############################################################

COGL_VERSION = 1.14.0
COGL_SITE = http://ftp.gnome.org/pub/GNOME/sources/cogl/1.14/
COGL_SOURCE=cogl-$(COGL_VERSION).tar.xz

COGL_DEPENDENCIES = libglib2

COGL_AUTORECONF = yes

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

define COGL_POST_INSTALL_PKGCONFIG
	cp -f $(@D)/cogl/*.pc $(STAGING_DIR)/usr/lib/pkgconfig/                                                       
#	cp -f $(@D)/cogl-pango/*.pc $(STAGING_DIR)/usr/lib/pkgconfig/                                                       
	cp -f $(@D)/cogl-gles2/*.pc $(STAGING_DIR)/usr/lib/pkgconfig/                                                       
endef  

COGL_POST_INSTALL_TARGET_HOOKS += COGL_POST_INSTALL_PKGCONFIG

$(eval $(autotools-package))
