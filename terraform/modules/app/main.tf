resource "yandex_compute_instance" "app" {
  name = "reddit-app"

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  zone = var.ci_zone

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      # id образа созданного в домашем задании к лекции 7
      image_id = var.app_disk_image
    }
  }

  network_interface {
    # для варианта с переменной var.subnet_id - id подсети default-ru-central1-a
    # для варианта с создаваемой сетью yandex_vpc_subnet.app-subnet.id
    subnet_id = var.app_subnet_id
    nat       = true
  }

  connection {
    type  = "ssh"
    host  = yandex_compute_instance.app.network_interface.0.nat_ip_address
    user  = "ubuntu"
    agent = false
    # путь до приватного ключа
    private_key = file(var.private_key)
  }

  provisioner "file" {
    source      = var.source_file
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "../files/deploy.sh"
  }
}
