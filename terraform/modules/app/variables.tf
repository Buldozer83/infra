variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}
#variable "private_key_path" {
#  description = "Path to the private key for work provissioner"
#}
variable "app_disk_image" {
  description = "Disk image for reddit app"
#  default = "reddit-app-base"
}
variable "app_machine_name" {
  description = "Name app machine"
  default = "reddit-app"
}
variable "type_machine" {
  description = "Type of machine"
  default = "g1-small"
}
variable "zones" {
  description = "Zone for avalability"
  default = "europe-west1-b"
}

