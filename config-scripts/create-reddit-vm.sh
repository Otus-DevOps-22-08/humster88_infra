#!/bin/bash
yc compute instance create --name reddit-app --hostname reddit-app --memory=4 --create-boot-disk image-folder-id=b1g663c64v4mhfl81ut0,image-family=reddit-base,size=10GB --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 --metadata serial-port-enable=1 --ssh-key ~/.ssh/id_rsa.pub
