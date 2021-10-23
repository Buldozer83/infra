variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}
#variable "private_key_path" {
#  description = "Path to the private key for work provissioner"
#}
variable "db_disk_image" {
  description = "Disk image for reddit app"
  default     = "reddit-db-base"
}
variable "db_machine_name" {
  description = "Name app machine"
  default     = "reddit-db"
}
variable "type_machine" {
  description = "Type of machine"
  default     = "g1-small"
}
variable "zones" {
  description = "Zone for avalability"
  default     = "europe-west1-b"
}

