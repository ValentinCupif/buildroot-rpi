#############################################################
#
# mlplayer
#
#############################################################

MLPLAYER_VERSION = 1.0
MLPLAYER_SITE_METHOD = local
MLPLAYER_SITE = $(TOPDIR)/package/mlplayer/src

MLPLAYER_DEPENDENCIES = qt5multimedia 

define MLPLAYER_CONFIGURE_CMDS
        (cd $(@D); \
                $(TARGET_MAKE_ENV) \
                $(HOST_DIR)/usr/bin/qmake \
			DEFINES+=_VERBOSE_ \
                        ./mlplayer.pro \
        )
endef

define MLPLAYER_BUILD_CMDS
        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define MLPLAYER_INSTALL_TARGET_CMDS
        $(INSTALL) -D -m 0755 $(@D)/mlplayer $(TARGET_DIR)/usr/bin
endef

define MLPLAYER_UNINSTALL_TARGET_CMDS
        rm -f $(TARGET_DIR)/usr/bin/mlplayer
endef

$(eval $(generic-package))
