
#############################################################
#
#   liblunaheartbeat
#
#############################################################

LIBLUNAHEARTBEAT_VERSION = master
LIBLUNAHEARTBEAT_AUTORECONF = YES
LIBLUNAHEARTBEAT_SITE = git@git.g77k.com:supercatexpert/luna-heartbeat.git
LIBLUNAHEARTBEAT_SITE_METHOD = git
LIBLUNAHEARTBEAT_INSTALL_STAGING = YES

define LIBLUNAHEARTBEAT_RUN_AUTOGEN
        cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef
LIBLUNAHEARTBEAT_PRE_CONFIGURE_HOOKS += LIBLUNAHEARTBEAT_RUN_AUTOGEN


$(eval $(autotools-package))
#$(eval luna-heartbeat)
