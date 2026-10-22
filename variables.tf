
variable "project_id" {
  description = "GCP project ID where the KMS keyring will be created."
  type        = string

  validation {
    condition     = length(trimspace(var.project_id)) > 0
    error_message = "project_id cannot be empty."
  }
}

variable "location" {
  description = "KMS location, such as global, us, or a supported regional location."
  type        = string

  validation {
    condition     = length(trimspace(var.location)) > 0
    error_message = "location cannot be empty."
  }
}

variable "keyring" {
  description = "Name of the KMS keyring."
  type        = string

  validation {
    condition     = length(trimspace(var.keyring)) > 0
    error_message = "keyring cannot be empty."
  }
}

variable "keys" {
  description = "Names of cryptographic keys to create in the keyring."
  type        = list(string)
  default     = []

  validation {
    condition     = length(var.keys) == length(distinct(var.keys))
    error_message = "Key names must be unique."
  }
}

variable "key_rotation_period" {
  description = "Rotation interval for cryptographic keys, in seconds."
  type        = string
  default     = "7776000s"
}

variable "key_protection_level" {
  description = "Protection level: SOFTWARE, HSM, EXTERNAL, or EXTERNAL_VPC."
  type        = string
  default     = "SOFTWARE"

  validation {
    condition = contains(
      ["SOFTWARE", "HSM", "EXTERNAL", "EXTERNAL_VPC"],
      var.key_protection_level
    )
    error_message = "Unsupported key protection level."
  }
}

variable "key_algorithm" {
  description = "Algorithm used for cryptographic key versions."
  type        = string
  default     = "GOOGLE_SYMMETRIC_ENCRYPTION"
}

variable "purpose" {
  description = "Immutable purpose of each cryptographic key."
  type        = string
  default     = "ENCRYPT_DECRYPT"
}

variable "key_destroy_scheduled_duration" {
  description = "Optional delay before a scheduled key-version destruction completes."
  type        = string
  default     = null
  nullable    = true
}

variable "prevent_destroy" {
  description = "Enable Terraform lifecycle protection against accidental key destruction."
  type        = bool
  default     = true
}

variable "skip_initial_version_creation" {
  description = "Create keys without automatically creating their initial versions."
  type        = bool
  default     = false
}

variable "import_only" {
  description = "Restrict keys to imported versions only."
  type        = bool
  default     = false
}

variable "crypto_key_backend" {
  description = "Optional EKM backend resource name for EXTERNAL_VPC keys."
  type        = string
  default     = null
  nullable    = true
}

variable "labels" {
  description = "Labels applied to supported KMS resources."
  type        = map(string)
  default     = {}
}

variable "set_owners_for" {
  description = "Names of keys for which owner IAM bindings should be configured."
  type        = list(string)
  default     = []
}

variable "owners" {
  description = "IAM members to receive owner permissions on selected keys."
  type        = list(string)
  default     = []
}

variable "set_encrypters_for" {
  description = "Names of keys for which encryption IAM bindings should be configured."
  type        = list(string)
  default     = []
}

variable "encrypters" {
  description = "IAM members to receive encryption permissions on selected keys."
  type        = list(string)
  default     = []
}

variable "set_decrypters_for" {
  description = "Names of keys for which decryption IAM bindings should be configured."
  type        = list(string)
  default     = []
}

variable "decrypters" {
  description = "IAM members to receive decryption permissions on selected keys."
  type        = list(string)
  default     = []
}
