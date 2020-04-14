
NODE_NAME=$(hostname)

#virtlet
mkdir -p /var/lib/virtlet/vms
mkdir -p /var/log/virtlet/vms
mkdir -p /var/run/libvirt
mkdir -p /var/run/netns
mkdir -p /var/lib/virtlet/volumes

docker run --rm --net=host --privileged --pid=host --uts=host --ipc=host --user=root \
--env VIRTLET_LOGLEVEL=4 --env VIRTLET_DISABLE_KVM=y \
--env KUBE_NODE_NAME=${NODE_NAME} \
--env PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
--env DEBIAN_FRONTEND=noninteractive \
--cgroup-parent /machine \
--cpu-shares 4 --cpu-period 100000 \
--mount type=bind,src=/etc/cni/net.d,dst=/etc/cni/net.d \
--mount type=bind,src=/opt/cni/bin,dst=/opt/cni/bin \
--mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
--mount type=bind,src=/var/lib/kubelet/testvolumes,dst=/var/run/secrets/kubernetes.io/serviceaccount,readonly \
--mount type=bind,src=/boot,dst=/boot,readonly \
--mount type=bind,src=/dev,dst=/dev \
--mount type=bind,src=/var/lib,dst=/var/lib \
--mount type=bind,src=/etc/libvirt/qemu,dst=/etc/libvirt/qemu \
--mount type=bind,src=/lib/modules,dst=/lib/modules,readonly \
--mount type=bind,src=/run,dst=/run \
-v /sys/fs/cgroup:/sys/fs/cgroup \
--mount type=bind,dst=/kubelet-volume-plugins,src=/usr/libexec/kubernetes/kubelet-plugins/volume/exec \
--mount type=bind,src=/var/lib/kubelet/pods,dst=/var/lib/kubelet/pods,bind-propagation=rshared \
--mount type=bind,src=/var/lib/libvirt,dst=/var/lib/libvirt \
--mount type=bind,src=/var/lib/virtlet,dst=/var/lib/virtlet,bind-propagation=rshared \
--mount type=bind,src=/var/log,dst=/var/log \
--mount type=bind,src=/var/log/pods,dst=/var/log/pods \
--mount type=bind,src=/var/log/virtlet,dst=/var/log/virtlet \
--mount type=bind,src=/var/log/libvirt,dst=/var/log/libvirt \
--mount type=bind,src=/var/log/virtlet/vms,dst=/var/log/vms \
--mount type=bind,src=/var/run/libvirt,dst=/var/run/libvirt \
--mount type=bind,src=/var/run/netns,dst=/var/run/netns,bind-propagation=rshared \
arktosstaging/vmruntime:latest /bin/bash -c "//prepare-node.sh > /var/log/virtlet/prepare-node.log 2>&1 "

docker run --rm --net=host --privileged --pid=host --uts=host --ipc=host --user=root \
--env VIRTLET_LOGLEVEL=4 --env VIRTLET_DISABLE_KVM=y \
--env KUBE_NODE_NAME=${NODE_NAME} \
--env PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
--env DEBIAN_FRONTEND=noninteractive \
--cgroup-parent /machine \
--cpu-shares 4 --cpu-period 100000 \
--mount type=bind,src=/etc/cni/net.d,dst=/etc/cni/net.d \
--mount type=bind,src=/opt/cni/bin,dst=/opt/cni/bin \
--mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
--mount type=bind,src=/var/lib/kubelet/testvolumes,dst=/var/run/secrets/kubernetes.io/serviceaccount,readonly \
--mount type=bind,src=/boot,dst=/boot,readonly \
--mount type=bind,src=/dev,dst=/dev \
--mount type=bind,src=/var/lib,dst=/var/lib \
--mount type=bind,src=/etc/libvirt/qemu,dst=/etc/libvirt/qemu \
--mount type=bind,src=/lib/modules,dst=/lib/modules,readonly \
--mount type=bind,src=/run,dst=/run \
-v /sys/fs/cgroup:/sys/fs/cgroup \
--mount type=bind,dst=/kubelet-volume-plugins,src=/usr/libexec/kubernetes/kubelet-plugins/volume/exec \
--mount type=bind,src=/var/lib/kubelet/pods,dst=/var/lib/kubelet/pods,bind-propagation=rshared \
--mount type=bind,src=/var/lib/libvirt,dst=/var/lib/libvirt \
--mount type=bind,src=/var/lib/virtlet,dst=/var/lib/virtlet,bind-propagation=rshared \
--mount type=bind,src=/var/log,dst=/var/log \
--mount type=bind,src=/var/log/pods,dst=/var/log/pods \
--mount type=bind,src=/var/log/virtlet,dst=/var/log/virtlet \
--mount type=bind,src=/var/log/libvirt,dst=/var/log/libvirt \
--mount type=bind,src=/var/log/virtlet/vms,dst=/var/log/vms \
--mount type=bind,src=/var/run/libvirt,dst=/var/run/libvirt \
--mount type=bind,src=/var/run/netns,dst=/var/run/netns,bind-propagation=rshared \
arktosstaging/vmruntime:latest /bin/bash -c "/vms.sh > /var/log/virtlet/vms.log 2>&1 " &

docker run --rm --net=host --privileged --pid=host --uts=host --ipc=host --user=root \
--env VIRTLET_LOGLEVEL=4 --env VIRTLET_DISABLE_KVM=y \
--env KUBE_NODE_NAME=${NODE_NAME} \
--env PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
--env DEBIAN_FRONTEND=noninteractive \
--cgroup-parent /machine \
--cpu-shares 4 --cpu-period 100000 \
--mount type=bind,src=/etc/cni/net.d,dst=/etc/cni/net.d \
--mount type=bind,src=/opt/cni/bin,dst=/opt/cni/bin \
--mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
--mount type=bind,src=/var/lib/kubelet/testvolumes,dst=/var/run/secrets/kubernetes.io/serviceaccount,readonly \
--mount type=bind,src=/boot,dst=/boot,readonly \
--mount type=bind,src=/dev,dst=/dev \
--mount type=bind,src=/var/lib,dst=/var/lib \
--mount type=bind,src=/etc/libvirt/qemu,dst=/etc/libvirt/qemu \
--mount type=bind,src=/lib/modules,dst=/lib/modules,readonly \
--mount type=bind,src=/run,dst=/run \
-v /sys/fs/cgroup:/sys/fs/cgroup \
--mount type=bind,dst=/kubelet-volume-plugins,src=/usr/libexec/kubernetes/kubelet-plugins/volume/exec \
--mount type=bind,src=/var/lib/kubelet/pods,dst=/var/lib/kubelet/pods,bind-propagation=rshared \
--mount type=bind,src=/var/lib/libvirt,dst=/var/lib/libvirt \
--mount type=bind,src=/var/lib/virtlet,dst=/var/lib/virtlet,bind-propagation=rshared \
--mount type=bind,src=/var/log,dst=/var/log \
--mount type=bind,src=/var/log/pods,dst=/var/log/pods \
--mount type=bind,src=/var/log/virtlet,dst=/var/log/virtlet \
--mount type=bind,src=/var/log/libvirt,dst=/var/log/libvirt \
--mount type=bind,src=/var/log/virtlet/vms,dst=/var/log/vms \
--mount type=bind,src=/var/run/libvirt,dst=/var/run/libvirt \
--mount type=bind,src=/var/run/netns,dst=/var/run/netns,bind-propagation=rshared \
arktosstaging/vmruntime:latest /bin/bash -c "/libvirt.sh > /var/log/virtlet/libvirt.log 2>&1" &

docker run --rm --net=host --privileged --pid=host --uts=host --ipc=host --user=root \
--env VIRTLET_LOGLEVEL=4 --env VIRTLET_DISABLE_KVM=y \
--env KUBE_NODE_NAME=${NODE_NAME} \
--env PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
--env DEBIAN_FRONTEND=noninteractive \
--cgroup-parent /machine \
--cpu-shares 4 --cpu-period 100000 \
--mount type=bind,src=/etc/cni/net.d,dst=/etc/cni/net.d \
--mount type=bind,src=/opt/cni/bin,dst=/opt/cni/bin \
--mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
--mount type=bind,src=/var/lib/kubelet/testvolumes,dst=/var/run/secrets/kubernetes.io/serviceaccount,readonly \
--mount type=bind,src=/boot,dst=/boot,readonly \
--mount type=bind,src=/dev,dst=/dev \
--mount type=bind,src=/var/lib,dst=/var/lib \
--mount type=bind,src=/etc/libvirt/qemu,dst=/etc/libvirt/qemu \
--mount type=bind,src=/lib/modules,dst=/lib/modules,readonly \
--mount type=bind,src=/run,dst=/run \
-v /sys/fs/cgroup:/sys/fs/cgroup \
--mount type=bind,dst=/kubelet-volume-plugins,src=/usr/libexec/kubernetes/kubelet-plugins/volume/exec \
--mount type=bind,src=/var/lib/kubelet/pods,dst=/var/lib/kubelet/pods,bind-propagation=rshared \
--mount type=bind,src=/var/lib/libvirt,dst=/var/lib/libvirt \
--mount type=bind,src=/var/lib/virtlet,dst=/var/lib/virtlet,bind-propagation=rshared \
--mount type=bind,src=/var/log,dst=/var/log \
--mount type=bind,src=/var/log/pods,dst=/var/log/pods \
--mount type=bind,src=/var/log/virtlet,dst=/var/log/virtlet \
--mount type=bind,src=/var/log/libvirt,dst=/var/log/libvirt \
--mount type=bind,src=/var/log/virtlet/vms,dst=/var/log/vms \
--mount type=bind,src=/var/run/libvirt,dst=/var/run/libvirt \
--mount type=bind,src=/var/run/netns,dst=/var/run/netns,bind-propagation=rshared \
arktosstaging/vmruntime:latest /bin/bash -c "/start.sh > /var/log/virtlet/start.log 2>&1" &

