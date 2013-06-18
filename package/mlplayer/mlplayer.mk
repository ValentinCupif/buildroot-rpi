#############################################################
#
# mlplayer
#
#############################################################

MLPLAYER_VERSION = 27e1d71ef78be51e13a006f85599d124f7442236
MLPLAYER_SITE_METHOD = git
MLPLAYER_SITE = https://github.com/msieben/mlplayer.git

MLPLAYER_DEPENDENCIES = qt5multimedia 

define MLPLAYER_CONFIGURE_CMDS
        (cd $(@D); \
                $(TARGET_MAKE_ENV) \
                $(HOST_DIR)/usr/bin/qmake \
			DEFINES+=_VERBOSE_ \
                        ./src/mlplayer.pro \
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
