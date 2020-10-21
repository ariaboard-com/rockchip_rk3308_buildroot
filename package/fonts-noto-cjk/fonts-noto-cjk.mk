################################################################################
#
# fonts-noto-cjk
#
################################################################################

FONTS_NOTO_CJK_VERSION = 1.004+repack2
FONTS_NOTO_CJK_SITE = http://deb.debian.org/debian/pool/main/f/fonts-noto-cjk
FONTS_NOTO_CJK_SOURCE = fonts-noto-cjk_$(FONTS_NOTO_CJK_VERSION).orig.tar.gz
FONTS_NOTO_CJK_LICENSE_FILES = LICENSE

FONTS_NOTO_CJK_FONTS_INSTALL = \
    NotoSansCJK-Black.ttc \
    NotoSansCJK-Light.ttc \
    NotoSansCJK-Thin.ttc \
    NotoSansCJK-Bold.ttc \
    NotoSansCJK-Medium.ttc \
    NotoSansCJK-DemiLight.ttc \
    NotoSansCJK-Regular.ttc


define FONTS_NOTO_CJK_FONTCONFIG_CONF_INSTALL_CMDS
        $(INSTALL) -D -m 755 package/fonts-noto-cjk/70-fonts-noto-cjk.conf \
                $(TARGET_DIR)/usr/share/fontconfig/conf.avail/70-fonts-noto-cjk.conf
endef

define FONTS_NOTO_CJK_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/fonts/truetype/
	for i in $(FONTS_NOTO_CJK_FONTS_INSTALL) ; do \
		$(INSTALL) -m 0644 $(@D)/$$i \
			$(TARGET_DIR)/usr/share/fonts/truetype/ || exit 1 ; \
	done
	$(FONTS_NOTO_CJK_FONTCONFIG_CONF_INSTALL_CMDS)
endef

$(eval $(generic-package))
