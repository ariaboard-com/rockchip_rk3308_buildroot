################################################################################
#
# wqy-zenhei
#
################################################################################

WQY_ZENHEI_VERSION = 0.9.45
WQY_ZENHEI_SITE = http://http.debian.net/debian/pool/main/f/fonts-wqy-zenhei
WQY_ZENHEI_SOURCE = fonts-wqy-zenhei_$(WQY_ZENHEI_VERSION).orig.tar.gz
WQY_ZENHEI_LICENSE_FILES = LICENSE

WQY_ZENHEI_FONTS_INSTALL = wqy-zenhei.ttc
WQY_ZENHEI_FONTCONFIG_CONF_INSTALL = \
    44-wqy-zenhei.conf \
    43-wqy-zenhei-sharp.conf


define WQY_ZENHEI_FONTCONFIG_CONF_INSTALL_CMDS
	for i in $(WQY_ZENHEI_FONTCONFIG_CONF_INSTALL) ; do \
		$(INSTALL) -D -m 0644 $(@D)/$$i \
			$(TARGET_DIR)/usr/share/fontconfig/conf.avail/$$i || exit 1 ; \
	done
endef

define WQY_ZENHEI_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/fonts/truetype/
	for i in $(WQY_ZENHEI_FONTS_INSTALL) ; do \
		$(INSTALL) -m 0644 $(@D)/$$i \
			$(TARGET_DIR)/usr/share/fonts/truetype/ || exit 1 ; \
	done
	$(WQY_ZENHEI_FONTCONFIG_CONF_INSTALL_CMDS)
endef

$(eval $(generic-package))
