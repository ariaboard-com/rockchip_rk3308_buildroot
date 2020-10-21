
#############################################################
#
#   libpudge
#
#############################################################

PUDGE_SERVER_VERSION = master
PUDGE_SERVER_AUTORECONF = YES
PUDGE_SERVER_SITE = git@git.g77k.com:supercatexpert/luna-pudge-server.git
PUDGE_SERVER_SITE_METHOD = git
PUDGE_SERVER_INSTALL_STAGING = YES

$(eval $(autotools-package))
