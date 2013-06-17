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
	--enable-xlib-egl-platform=no \
	--enable-gtk-doc-html=no \
	--enable-cairo=no \
	--enable-cogl-pango=no \
	--enable-gdl-egl-platform=no

define COGL_POST_INSTALL_FILES
	$(INSTALL) -m 755 -D $(@D)/cogl/*.pc $(STAGING_DIR)/usr/lib/pkgconfig/                                                       

	$(INSTALL) -m 755 -D $(@D)/cogl-pango/*.pc $(STAGING_DIR)/usr/lib/pkgconfig/                                                       
	$(INSTALL) -m 755 -D $(@D)/cogl-gles2/*.pc $(STAGING_DIR)/usr/lib/pkgconfig/                                                       

	mkdir -p $(STAGING_DIR)/usr/include/cogl/ 
	$(INSTALL) -m 755 -D $(@D)/cogl/*.h $(STAGING_DIR)/usr/include/cogl/ 

	mkdir -p $(STAGING_DIR)/usr/include/cogl-pango/ 
	$(INSTALL) -m 755 -D $(@D)/cogl-pango/*.h $(STAGING_DIR)/usr/include/cogl-pango/ 
endef  

COGL_POST_INSTALL_TARGET_HOOKS += COGL_POST_INSTALL_FILES

$(eval $(autotools-package))
