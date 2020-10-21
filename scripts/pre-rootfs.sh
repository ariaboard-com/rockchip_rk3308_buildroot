#!/bin/sh

HAVE_ROOT_IN_PULSE_GROUP="$(grep pulse-access ${TARGET_DIR}/etc/group | grep root)"

if [ x"${HAVE_ROOT_IN_PULSE_GROUP}" = x"" ]; then
    sed -i '/^pulse-access:/ s/$/,root/' ${TARGET_DIR}/etc/group
fi

if [ -d "${TARGET_DIR}/etc/NetworkManager" ]; then
    rm -rf "${TARGET_DIR}/etc/NetworkManager"
    ln -sf "/userdata/etc/NetworkManager" "${TARGET_DIR}/etc/NetworkManager"
fi
