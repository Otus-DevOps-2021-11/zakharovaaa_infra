variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable ci_zone {
  description = "Compute instance zone"
  # Значение по умолчанию
  default = "ru-central1-b"
}
variable app_subnet_id {
  description = "Subnet"
}
variable private_key {
  description = "Private key for connection"
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
variable source_file {
  description = "Path to file with our app"
  default     = "files/puma.service"
}
