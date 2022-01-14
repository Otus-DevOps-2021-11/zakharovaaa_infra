variable cloud_id {
  description = "Cloud"
}
variable folder_id {
  description = "Folder"
}
variable zone {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable image_id {
  description = "Disk image"
}
variable subnet_id {
  description = "Subnet"
}
variable service_account_key_file {
  description = "key.json"
}
variable token {
  description = "Token for authentification"
}
variable private_key {
  description = "Private key for connection"
}
variable ci_zone {
  description = "Compute instance zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default = "reddit-app-base"
}
variable db_disk_image {
  description = "Disk image for reddit db"
  default = "reddit-db-base"
}
variable app_subnet_id {
  description = "Subnet"
}
variable source_file {
  description = "Path to file with our app"
  default = "files/puma.service"
}
