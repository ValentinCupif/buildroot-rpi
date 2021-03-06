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
	--enable-wgl=no \
	--enable-xlib-egl-platform=no \
	--enable-gtk-doc-html=no \
	--enable-cairo=no \
	--enable-gl=no \ 
	--enable-gdl-egl-platform=no \
	--enable-wayland-egl-platform=yes \
	--enable-wayland-egl-server=yes 

ifeq ($(BR2_PACKAGE_PANGO), y)
COGL_DEPENDENCIES += pango
COGL_CONF_OPT += \
	--enable-cogl-pango=yes
else
ifeq ($(BR2_PACKAGE_CLUTTER), y) # to build cogl-pango for clutter
COGL_DEPENDENCIES += pango
COGL_CONF_OPT += \
	--enable-cogl-pango=yes
else
COGL_CONF_OPT += \
	--enable-cogl-pango=no 
endif
endif

define COGL_POST_INSTALL_FILES
	$(INSTALL) -m 755 -D $(@D)/cogl/*.pc $(STAGING_DIR)/usr/lib/pkgconfig/                                                       
	mkdir -p $(STAGING_DIR)/usr/include/cogl/ 
	$(INSTALL) -m 755 -D $(@D)/cogl/*.h $(STAGING_DIR)/usr/include/cogl/ 

	$(INSTALL) -m 755 -D $(@D)/cogl-pango/*.pc $(STAGING_DIR)/usr/lib/pkgconfig/                                                       
	mkdir -p $(STAGING_DIR)/usr/include/cogl-pango/ 
	$(INSTALL) -m 755 -D $(@D)/cogl-pango/*.h $(STAGING_DIR)/usr/include/cogl-pango/ 

	if [ -d "$(@D)/cogl-pango/.libs/" ]; then $(INSTALL) -m 755 -D $(@D)/cogl-pango/.libs/*.so* $(STAGING_DIR)/usr/lib/ ; fi;
	$(INSTALL) -m 755 -D $(@D)/cogl/.libs/*.so* $(STAGING_DIR)/usr/lib/ 
	$(INSTALL) -m 755 -D $(@D)/cogl-gles2/.libs/*.so* $(STAGING_DIR)/usr/lib/ 
endef


COGL_POST_INSTALL_TARGET_HOOKS += COGL_POST_INSTALL_FILES

$(eval $(autotools-package))
