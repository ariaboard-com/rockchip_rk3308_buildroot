################################################################################
#
# pudge-ntdriver-box-lf
#
################################################################################

PUDGE_NTDRIVER_BOX_LF_VERSION = master
PUDGE_NTDRIVER_BOX_LF_VERSION = master
PUDGE_NTDRIVER_BOX_LF_SITE = git@git.g77k.com:qichunren/driverbox-ui-ddb.git
PUDGE_NTDRIVER_BOX_LF_SITE_METHOD = git

define PUDGE_NTDRIVER_BOX_LF_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/pudge-driverbox-ui-lf
        mkdir -p $(TARGET_DIR)/usr/share/pudge-driverbox-ui-lf/controls
	mkdir -p $(TARGET_DIR)/usr/share/sounds

	cd $(@D); rm -rf git ; git clone git@git.g77k.com:qichunren/driverbox-ui-ddb.git git
	cd $(@D)/git; git log -1 --date=format:"%Y%m%d%H%M%S" --format="%ad" > $(TARGET_DIR)/usr/share/pudge-driverbox-ui-lf/VERSION
	cd $(@D)/git; git rev-parse --short HEAD > $(TARGET_DIR)/usr/share/pudge-driverbox-ui-lf/COMMIT

	rm -rf $(@D)/git

	$(INSTALL) -m 0755 $(@D)/src/*.py $(TARGET_DIR)/usr/share/pudge-driverbox-ui-lf
        $(INSTALL) -m 0755 $(@D)/src/controls/*.py $(TARGET_DIR)/usr/share/pudge-driverbox-ui-lf/controls
        $(INSTALL) -m 0755 $(@D)/data/*.wav $(TARGET_DIR)/usr/share/sounds
endef

$(eval $(generic-package))
