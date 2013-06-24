#############################################################
#
# qt5jsbackend
#
#############################################################

# Friday May 31 2013, stable
QT5JSBACKEND_VERSION = 6f2625e0e0e2818af6fdeb69528ada18556daef2
# Friday May 31 2013, release
#QT5JSBACKEND_VERSION = 7d469e82e274d334c7d03d81b10d225c59d30798
QT5JSBACKEND_SITE = git://gitorious.org/qt/qtjsbackend.git
QT5JSBACKEND_SITE_METHOD = git

#QT5JSBACKEND_VERSION = $(QT5_VERSION)
#QT5JSBACKEND_SITE = $(QT5_SITE)
#QT5JSBACKEND_SOURCE = qtjsbackend-opensource-src-$(QT5JSBACKEND_VERSION).tar.xz

QT5JSBACKEND_DEPENDENCIES = qt5base

QT5JSBACKEND_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
QT5JSBACKEND_CONFIGURE_OPTS += -opensource -confirm-license
QT5JSBACKEND_LICENSE = LGPLv2.1 or GPLv3.0
# Here we would like to get license files from qt5base, but qt5base
# may not be extracted at the time we get the legal-info for
# qt5script.
else
QT5JSBACKEND_LICENSE = Commercial license
QT5JSBACKEND_REDISTRIBUTE = NO
endif

define QT5JSBACKEND_CONFIGURE_CMDS
	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
endef

define QT5JSBACKEND_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define QT5JSBACKEND_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
	$(QT5_LA_PRL_FILES_FIXUP)
endef

ifeq ($(BR2_PREFER_STATIC_LIB),)
define QT5JSBACKEND_INSTALL_TARGET_CMDS
	cp -dpf $(STAGING_DIR)/usr/lib/libQt5V8*.so.* $(TARGET_DIR)/usr/lib
endef
endif

$(eval $(generic-package))
