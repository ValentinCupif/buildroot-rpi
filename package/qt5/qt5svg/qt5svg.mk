#############################################################
#
# qt5svg
#
#############################################################

# Tuesday June 11 2013, stable
QT5SVG_VERSION = 1ce9af6c1c32b20dedc33bd46cde5ee4b34a04c1
# Tuesday May 28 2013, release
#QT5SVG_VERSION = 0b7bb2bd2d7404c42dd782975b665c9415409e0c
QT5SVG_SITE = git://gitorious.org/qt/qtsvg.git
QT5SVG_SITE_METHOD = git

#QT5SVG_VERSION = $(QT5_VERSION)
#QT5SVG_SITE = $(QT5_SITE)
#QT5SVG_SOURCE = qtsvg-opensource-src-$(QT5SVG_VERSION).tar.xz

QT5SVG_DEPENDENCIES = qt5base

QT5SVG_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
QT5SVG_CONFIGURE_OPTS += -opensource -confirm-license
QT5SVG_LICENSE = LGPLv2.1 or GPLv3.0
# Here we would like to get license files from qt5base, but qt5base
# may not be extracted at the time we get the legal-info for qt5svg.
else
QT5SVG_LICENSE = Commercial license
QT5SVG_REDISTRIBUTE = NO
endif

define QT5SVG_CONFIGURE_CMDS
	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
endef

define QT5SVG_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define QT5SVG_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
	$(QT5_LA_PRL_FILES_FIXUP)
endef

ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS),y)
define QT5SVG_INSTALL_ICONENGINES
	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/iconengines $(TARGET_DIR)/usr/lib/qt/plugins
endef
endif

ifeq ($(BR2_PREFER_STATIC_LIB),)
define QT5SVG_INSTALL_TARGET_CMDS
	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Svg*.so.* $(TARGET_DIR)/usr/lib
	cp -dpf $(STAGING_DIR)/usr/lib/qt/plugins/imageformats/libqsvg.so $(TARGET_DIR)/usr/lib/qt/plugins/imageformats/
	$(QT5SVG_INSTALL_ICONENGINES)
endef
endif

$(eval $(generic-package))
