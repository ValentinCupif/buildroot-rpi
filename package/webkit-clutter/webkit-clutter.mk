#############################################################
#
# webkit-clutter
#
#############################################################

# 2013-06-07 17:50:12 (GMT)
WEBKIT_CLUTTER_VERSION = 6960cd716129f050c62d0d16fbe92f686fa225e8
WEBKIT_CLUTTER_SITE_METHOD = git
WEBKIT_CLUTTER_SITE = git://git.collabora.co.uk/git/webkit-clutter.git
#WEBKIT_CLUTTER_SITE = http://cgit.collabora.com/git/webkit-clutter.git

WEBKIT_CLUTTER_DEPENDENCIES = clutter gperf webp libsoup libxslt
#libsecret

WEBKIT_CLUTTER_CONF_OPT += \
	--enable-credential-storage=no \
	--enable-geolocation=no \
	--with-target=directfb \
	 --enable-video=no

define WEBKIT_CLUTTER_RUN_AUTOCONF

	(cd $(@D); \
		PATH=$(PATH):$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin \
		LIBTOOLIZE=$(LIBTOOLIZE) \
		ACLOCAL_FLAGS=$(ACLOCAL_FLAGS) \
		ACLOCAL="$(ACLOCAL)" \
		AUTOHEADER=$(AUTOHEADER) \
		AUTOCONF=$(AUTOCONF) \
		AUTOMAKE=$(AUTOMAKE) \
		AUTOM4TE=$(HOST_DIR)/usr/bin/autom4te \
                NOCONFIGURE=1 \
		./autogen.sh)
endef

WEBKIT_CLUTTER_PRE_CONFIGURE_HOOKS += WEBKIT_CLUTTER_RUN_AUTOCONF

$(eval $(autotools-package))
