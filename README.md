# humster88_infra
humster88 Infra repository

![tests for infra repo](https://github.com/Otus-DevOps-22-08/humster88_infra/actions/workflows/test_infra_repo.yml/badge.svg)

BASTION HOMEWORK:

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


YC HOMEWORK:

testapp_IP = 84.201.129.152
testapp_port = 9292

instance deploy command:
yc compute instance create --name reddit-app --hostname reddit-app --memory=4 --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 --metadata serial-port-enable=1 --metadata-from-file user-data=./startup.yaml


PACKER HOMEWORK:

1. Написан параметризованный из файла с переменными packer/variables.json шаблон создания наполовину настроенного образа ВМ packer/ubuntu16.json
2. Написан параметризованный из файла с переменными packer/files/immutable_variables.json шаблон создания полностью настроенного и готового к деплою образа ВМ packer/immutable.json
3. Написан скрипт config-scripts/create-reddit-vm.sh, который создает ВМ с помощью Yandex.Cloud CLI из полностью подготовленного образа из пункта 2


TERRAFORM_1 HOMEWORK:
1. main.tf создаем инстансы
2. lb.tf создаем балансировщик, целевую группу, включаем в нее инстансы
3. variables.tf описываем переменные, используемые в манифестах
4. outputs.tf выводим на экран адреса инстансов и балансировщика
Проблема в разных и не синхронизированных базах данных инстансов, дублировании кода.
5. count инстансов задана через переменную

TERRAFORM_2 HOMEWORK:
1. переписано с использованием модулей для db и app частей проекта
2. state хранится в yandex object storage bucket
3. добавлен provisioner
4. отключаемый provisioner

ANSIBLE_1 HOMEWORK:
1. установлен ansible
2. написан инвентарь(ini, yaml, с группами)
3. написан ansible.cfg
4. проверена работа модулей ansible
5. склонированы исходники приложения
6. протестирована идемпотентность
7. написан плейбук

ANSIBLE_2 HOMEWORK:
1. Используем плейбуки, хендлеры и шаблоны для конфигурации
окружения и деплоя тестового приложения. Подход один плейбук, один
сценарий (play)
2. Аналогично один плейбук, но много сценариев
3. И много плейбуков
4. Изменим провижн образов Packer на Ansible-плейбуки

ANSIBLE_3 HOMEWORK:
1. Переносим созданные плейбуки в раздельные роли
2. Описываем два окружения
3. Используем коммьюнити роль nginx
4. Используем Ansible Vault для наших окружений
5. Настройка TravisCI

ANSIBLE_4 HOMEWORK:
• Локальная разработка при помощи Vagrant,
доработка ролей для провижининга в Vagrant
• Тестирование ролей при помощи Molecule и
Testinfra
• Переключение сбора образов пакером на
использование ролей
• * Подключение Travis CI для автоматического
прогона тестов(говно, нет драйвера YandexCloud для Molecule)
