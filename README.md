# домашнее задание к лекции 12
- созданы  роли на основе созданных ранее плейбуков
- создано два окружения: stage и prod
- с помощью модулей Terraform создано 2 ВМ в Yandex Cloud для обоих окружений: stage и prod
- использована коммьюнити-роль nginx
- пароли пользователей зашифрованы ansible-vault
# домашнее задание к лекции 11
с помощью Packer созданы два новых образа для сервера БД и сервера приложения с провиженерами ansible-сценариями вместо sh-скриптов.
с помощью модулей Terraform создано 2 ВМ в Yandex Cloud: сервер БД и сервер приложения в окружении stage.
с помощью основного плейбука site.yml сервера бд и приложения настроены и сконфигурированы.
# домашнее задание к лекции 10
Теперь выполните ansible app -m command -a 'rm -rf ~/reddit' и проверьте еще раз выполнение плейбука. Что изменилось и почему? Добавьте информацию в README.md .
ответ: папка с гита залилась на сервер - это видно в выводе работы плейбука по состоянию changed
TASK [Clone repo] **********************************************************************************************************************************************************
changed: [appserver]

PLAY RECAP *****************************************************************************************************************************************************************
appserver                  : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
# домашнее задание к лекции 9
с помощью Packer созданы два новых образа для сервера БД и сервера приложения.
с помощью модулей Terraform создано 2 ВМ в Yandex Cloud: сервер БД и сервер приложения; и два окружения stage и prod; модули параметризированы.
Пример вывода в консоли после успешного создания при последней проверке:
module.app.yandex_compute_instance.app: Creation complete after 3m9s [id=epdmhsu2luqv3frdes5r]
Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
Outputs:
external_ip_address_app = 51.250.27.45
external_ip_address_db = 51.250.3.250
# домашнее задание к лекции 8
с помощью Terraform создана ВМ в Yandex Cloud, в описании часть значений вынесено в input-переменные, использованы провижинеры для деплоя последней версии приложения на созданную ВМ
запущенное приложение можно проверить по адресу
http://51.250.6.224:9292/
# домашнее задание к лекции 7
с помощью Packer создан образ для создания ВМ в Yandex Cloud, шаблон образа парметризирован
запущенное приложение можно проверить по адресу
http://51.250.10.62:9292/
# домашнее задание к лекции 6
testapp_IP = 51.250.8.131
testapp_port = 9292
# команда CLI для создания инстанса с уже запущенным приложением
yc compute instance create --name reddit-app --hostname reddit-app --memory=4 --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4  --metadata serial-port-enable=1 --metadata-from-file key=~/startup-script.sh --ssh-key ~/.ssh/appuser.pub
# домашнее задание к лекции 5
bastion_IP = 62.84.114.90
someinternalhost_IP = 10.128.0.6
# 5.1 самостоятельное задание: Исследовать способ подключения к someinternalhost в одну команду
# решение: объединение двух ранее выполненных команд в одну позволяет попасть на someinternalhost сразу, результат выполнения ниже
PS C:\Users\Alina> ssh -i .\Documents\otus-devops\appuser -A appuser@62.84.114.90 ssh 10.128.0.25
Pseudo-terminal will not be allocated because stdin is not a terminal.
Welcome to Ubuntu 16.04.7 LTS (GNU/Linux 4.4.0-142-generic x86_64)
 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
hostname
someinternalhost
# 5.2 дополнительное задание: Предложить вариант решения для подключения из консоли
# при помощи команды ssh someinternalhost по алиасу
# решение: в файл .ssh/config добавлен алиас с настроенной опцией ProxyCommand, результат выполнения ниже
PS C:\Users\Alina> ssh someinternalhost
Welcome to Ubuntu 16.04.7 LTS (GNU/Linux 4.4.0-142-generic x86_64)
 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
appuser@someinternalhost:~$ hostname
someinternalhost
