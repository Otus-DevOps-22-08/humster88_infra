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
variable cnt {
  type        = number
  description = "Count of instances"
  # Значение по умолчанию
  default = 1
}
variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable private_key_path {
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
  description = "key .json"
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}
variable "bucket_access_key" {
  description = "bucket_access_key"
}
variable "bucket_secret_key" {
  description = "bucket_secret_key"
}
variable "db_ip" {
  description = "IP address of the database server"
  default = "127.0.0.1"
}
variable "auto_deploy" {
  description = "Auto deploy application"
  type        = bool
}
