#!/usr/bin/env bash

sudo update-alternatives --set editor /usr/bin/vim.basic

echo 'ubuntu ALL=(ALL:ALL) NOPASSWD:ALL' | sudo EDITOR='tee -a' visudo
echo 'root ALL=(ALL:ALL) NOPASSWD:ALL' | sudo EDITOR='tee -a' visudo



patch -p1 << EOL
diff --git a/tools/images/kubeadm-aio/assets/opt/playbooks/vars.yaml b/tools/images/kubeadm-aio/assets/opt/playbooks/vars.yaml
index 17038fa..551c325 100644
--- a/tools/images/kubeadm-aio/assets/opt/playbooks/vars.yaml
+++ b/tools/images/kubeadm-aio/assets/opt/playbooks/vars.yaml
@@ -20,13 +20,12 @@ all:
       gid: null
       home: null
     external_dns_nameservers:
-      - 8.8.8.8
-      - 8.8.4.4
+      - 192.168.2.195
     calico:
       prometheus_port: 9091
     cluster:
       cni: calico
-      cni_host_ip: 10.96.232.136
+      cni_host_ip: 100.96.232.136
     kubelet:
       container_runtime: docker
       net_support_linuxbridge: true
@@ -48,8 +47,8 @@ all:
         advertiseAddressDevice: null
       networking:
         dnsDomain: cluster.local
-        podSubnet: 192.168.0.0/16
-        serviceSubnet: 10.96.0.0/12
+        podSubnet: 100.64.0.0/16
+        serviceSubnet: 100.96.0.0/12
     gate:
       fqdn_testing: false
       ingress_ip: 127.0.0.1
EOL


