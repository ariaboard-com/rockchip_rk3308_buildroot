################################################################################
#
# pudge-ntdriver-box
#
################################################################################

PUDGE_NTDRIVER_BOX_VERSION = master
PUDGE_NTDRIVER_BOX_SITE = git@git.g77k.com:qichunren/driver-box.git
PUDGE_NTDRIVER_BOX_SITE_METHOD = git
PUDGE_NTDRIVER_BOX_INSTALL_STAGING = YES
PUDGE_NTDRIVER_BOX_DEPENDENCIES = qt5base pudge-server

define PUDGE_NTDRIVER_BOX_CONFIGURE_CMDS
        (cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
endef

define PUDGE_NTDRIVER_BOX_BUILD_CMDS
        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define PUDGE_NTDRIVER_BOX_INSTALL_STAGING_CMDS
        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
endef

define PUDGE_NTDRIVER_BOX_INSTALL_TARGET_CMDS
        cp -dpfr $(@D)/luna-pudge-driverbox $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))

