#############################################################
#
# webkit-clutter
#
#############################################################

# 2013-06-07 17:50:12 (GMT)
WEBKIT_CLUTTER_VERSION = 6960cd716129f050c62d0d16fbe92f686fa225e8
WEBKIT_CLUTTER_SITE_METHOD = git
WEBKIT_CLUTTER_SITE = git://git.collabora.co.uk/git/webkit-clutter.git
#http://cgit.collabora.com/git/webkit-clutter.git

WEBKIT_CLUTTER_DEPENDENCIES = clutter

WEBKIT_CLUTTER_AUTORECONF = yes

define WEBKIT_CLUTTER_CONFIGURE_CMDS
endef

define WEBKIT_CLUTTER_BUILD_CMDS
endef

define WEBKIT_CLUTTER_INSTALL_TARGET_CMDS
endef

define WEBKIT_CLUTTER_UNINSTALL_TARGET_CMDS
endef

$(eval $(autotools-package))
