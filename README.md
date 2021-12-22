# домашнее задание к лекции 6
testapp_IP = 51.250.8.131
testapp_port = 9292
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
