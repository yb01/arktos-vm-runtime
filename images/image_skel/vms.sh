#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
set -o errtrace

# ensure a name service
echo nameserver 8.8.8.8 > /etc/resolv.conf

echo "$$ $(cut -d' ' -f22 /proc/$$/stat)" >/var/lib/virtlet/vms.procfile
sleep Infinity
