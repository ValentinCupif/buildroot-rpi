#############################################################
#
# qt5declarative
#
#############################################################

# Saturday June 22 2013, stable
QT5DECLARATIVE_VERSION = 544978388f5106cada4bc0a836293ab2063a8beb
# Thursday June 20 2013, stable
#QT5DECLARATIVE_VERSION = e357f015391ac32e8d262b4ea2bd0e3fe1e87fe6
# Tuesday June 04 2013, release
#QT5DECLARATIVE_VERSION = 65a9318f8fbfe6e3c1f33675fea435a76b869870
QT5DECLARATIVE_SITE = git://gitorious.org/qt/qtdeclarative.git
QT5DECLARATIVE_SITE_METHOD = git

#QT5DECLARATIVE_VERSION = $(QT5_VERSION)
#QT5DECLARATIVE_SITE = $(QT5_SITE)
#QT5DECLARATIVE_SOURCE = qtdeclarative-opensource-src-$(QT5DECLARATIVE_VERSION).tar.xz

QT5DECLARATIVE_DEPENDENCIES = qt5base qt5xmlpatterns qt5jsbackend

QT5DECLARATIVE_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
QT5DECLARATIVE_CONFIGURE_OPTS += -opensource -confirm-license
QT5DECLARATIVE_LICENSE = LGPLv2.1 or GPLv3.0
# Here we would like to get license files from qt5base, but qt5base
# may not be extracted at the time we get the legal-info for
# qt5script.
else
QT5DECLARATIVE_LICENSE = Commercial license
QT5DECLARATIVE_REDISTRIBUTE = NO
endif

define QT5DECLARATIVE_CONFIGURE_CMDS
	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
endef

define QT5DECLARATIVE_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
		sub-src-all sub-tools-all
endef

define QT5DECLARATIVE_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
		sub-src-install_subtargets \
		sub-tools-install_subtargets
	$(QT5_LA_PRL_FILES_FIXUP)
endef

ifeq ($(BR2_PREFER_STATIC_LIB),)
define QT5DECLARATIVE_INSTALL_TARGET_LIBS
	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Qml*.so.* $(TARGET_DIR)/usr/lib
	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Quick*.so.* $(TARGET_DIR)/usr/lib
	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/qml* $(TARGET_DIR)/usr/lib/qt/plugins
endef
endif

define QT5DECLARATIVE_INSTALL_TARGET_CMDS
	cp -dpf $(STAGING_DIR)/usr/bin/qml* $(TARGET_DIR)/usr/bin
	cp -dpfr $(STAGING_DIR)/usr/qml $(TARGET_DIR)/usr
	$(QT5DECLARATIVE_INSTALL_TARGET_LIBS)
endef

$(eval $(generic-package))
