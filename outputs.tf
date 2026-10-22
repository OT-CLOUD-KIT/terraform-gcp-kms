
output "keyring_name" {
  description = "Name of the created KMS keyring."
  value       = module.kms.keyring_name
}

output "keyring" {
  description = "Resource link for the KMS keyring."
  value       = module.kms.keyring
}

output "key_ids" {
  description = "IDs of the cryptographic keys."
  value       = module.kms.key_id_list
}

output "keys" {
  description = "Map of key names to their resource links."
  value       = module.kms.keys
}
