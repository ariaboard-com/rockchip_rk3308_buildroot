################################################################################
#
# python-asclepius
#
################################################################################

PYTHON_ASCLEPIUS_VERSION = master
PYTHON_ASCLEPIUS_SITE = git@git.g77k.com:supercatexpert/libasclepius.git
PYTHON_ASCLEPIUS_SITE_METHOD = git
PYTHON_ASCLEPIUS_SETUP_TYPE = distutils
PYTHON_ASCLEPIUS_DEPENDENCIES = libglib2 python3 json-c
PYTHON_ASCLEPIUS_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS = --include .git

$(eval $(python-package))
