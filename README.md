# humster88_infra
humster88 Infra repository

Bastion homework:

bastion_IP = 51.250.70.201
someinternalhost_IP = 10.128.0.10
1. Connect to someinternalhost via one command:
ssh -J appuser@51.250.70.201 appuser@10.128.0.10
2. Connect via "ssh someinternalhost":
create ~/.ssh/config:
Host bastion
        HostName 51.250.70.201
        IdentityFile /root/.ssh/id_rsa
        User appuser
Host someinternalhost
        HostName 10.128.0.10
        User appuser
        ProxyCommand ssh -q -W %h:%p bastion
3. Connect via openvpn, cloud-bastion.ovpn file in repo
4. Enable Let's Encrypt function for 51-250-70-201.sslip.io domain in pritunl configuration


YC homework:

testapp_IP = 84.201.129.152
testapp_port = 9292

instance deploy command:
yc compute instance create --name reddit-app --hostname reddit-app --memory=4 --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 --metadata serial-port-enable=1 --metadata-from-file user-data=./startup.yaml
