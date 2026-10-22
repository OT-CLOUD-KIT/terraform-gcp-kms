
module "kms" {
  source = "../../"

  project_id = var.project_id
  location   = "asia-south1"
  keyring    = "example-application-keyring"

  keys = [
    "application-data",
    "application-backup"
  ]

  key_rotation_period  = "7776000s"
  key_protection_level = "SOFTWARE"
  purpose              = "ENCRYPT_DECRYPT"

  prevent_destroy = true

  labels = {
    environment = "example"
    managed_by  = "terraform"
  }
}
