#!/bin/sh

CONFIGURE="$(dirname "$0")/configure --python=python2"
TARGETS='mipsel-softmmu'
DISABLES='docs guest-agent guest-agent-msi gnutls nettle gcrypt sdl vte vnc virtfs xen curl bluez kvm hax vde vhost-net spice rbd libnfs libusb usb-redir lzo snappy bzip2 seccomp tpm libssh2 vhost-vsock opengl virglrenderer tools'

cmdline="$CONFIGURE --target-list=$(echo "$TARGETS" | sed 's/ /,/g')"

for o in $DISABLES
do
	cmdline="$cmdline --disable-$o"
done

echo "cmdline: $cmdline"
$cmdline
