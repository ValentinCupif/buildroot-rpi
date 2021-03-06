#############################################################
#
# harfbuzz
#
#############################################################

HARFBUZZ_VERSION = 0.9.18
HARFBUZZ_SITE = http://www.freedesktop.org/software/harfbuzz/release/
HARFBUZZ_SOURCE=harfbuzz-$(HARFBUZZ_VERSION).tar.bz2

HARFBUZZ_DEPENDENCIES = libglib2 cairo freetype

HARFBUZZ_AUTORECONF = yes

HARFBUZZ_CONF_OPT =  \

define HARFBUZZ_POST_INSTALL_PKGCONFIG
endef  

HARFBUZZ_POST_INSTALL_TARGET_HOOKS += HARFBUZZ_POST_INSTALL_PKGCONFIG

define HARFBUZZ_POST_INSTALL_FILES
	$(INSTALL) -m 755 -D $(@D)/src/*.pc $(STAGING_DIR)/usr/lib/pkgconfig/                                                       
	$(INSTALL) -m 755 -D $(@D)/src/*.h $(STAGING_DIR)/usr/include/                                                       
	$(INSTALL) -m 755 -D $(@D)/src/.libs/*.so $(STAGING_DIR)/usr/lib/                                                       
endef  

HARFBUZZ_POST_INSTALL_TARGET_HOOKS += HARFBUZZ_POST_INSTALL_FILES

$(eval $(autotools-package))
