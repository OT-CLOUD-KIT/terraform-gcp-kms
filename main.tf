
module "kms" {
  source  = "terraform-google-modules/kms/google"
  version = "4.2.1"

  project_id = var.project_id
  location   = var.location
  keyring    = var.keyring

  keys                           = var.keys
  key_rotation_period            = var.key_rotation_period
  key_protection_level           = var.key_protection_level
  key_algorithm                  = var.key_algorithm
  purpose                        = var.purpose
  key_destroy_scheduled_duration = var.key_destroy_scheduled_duration
  prevent_destroy                = var.prevent_destroy
  skip_initial_version_creation  = var.skip_initial_version_creation
  import_only                    = var.import_only
  crypto_key_backend             = var.crypto_key_backend
  labels                         = var.labels

  set_owners_for     = var.set_owners_for
  owners             = var.owners
  set_encrypters_for = var.set_encrypters_for
  encrypters         = var.encrypters
  set_decrypters_for = var.set_decrypters_for
  decrypters         = var.decrypters
}
