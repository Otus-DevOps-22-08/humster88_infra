resource "yandex_storage_bucket" "tfbackend" {
  access_key = var.bucket_access_key
  secret_key = var.bucket_secret_key
  bucket     = "tfbackend"
}
