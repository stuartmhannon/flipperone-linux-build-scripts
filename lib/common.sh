#!/bin/bash
#
# lib/common.sh — shared functions for Flipper One kernel build scripts.
#
# copy_kernel_output — copy built kernel artifacts into LINUX_OUT/<subdir>.
#   Usage: copy_kernel_output <subdir>
#   Example: copy_kernel_output linux-mainline-files
#

copy_kernel_output() {
	local subdir="$1"
	mkdir -p "$LINUX_OUT/$subdir/dtbs"
	mv "$LINUX_DIR"/../linux-*.* "$LINUX_OUT"/
	mv "$LINUX_DIR"/modules.tar.gz "$LINUX_OUT/$subdir"/
	mv "$LINUX_DIR"/tar-install/boot/vmlinuz-* "$LINUX_OUT/$subdir"/vmlinuz
	mv "$LINUX_DIR"/tar-install/boot/config-* "$LINUX_OUT/$subdir"/config
	mv "$LINUX_DIR"/tar-install/boot/System.map-* "$LINUX_OUT/$subdir"/System.map
	mv "$LINUX_DIR"/tar-install/boot/dtbs/*/rockchip "$LINUX_OUT/$subdir"/dtbs/
}
