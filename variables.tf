#which host do you want to apply this to
variable "proxmox_host" {
  default = "New-Chungus"
}
#which vm template to use
variable "template_name" {
  default = "ubuntu-server"
}
#which nic would you like to use
variable "nic_name" {
  default = "vmbr0"
}
#url of the host you are connecting to, pulled from .tfvars file
variable "proxmox_api_url" {
  type = string
}
#value pulled from the .tfvars file
variable "proxmox_api_token_id" {
  type      = string
  sensitive = true
}
#value pulled from the .tfvars file
variable "proxmox_api_token_secret" {
  type      = string
  sensitive = true
}
#etered manually during apply
variable "ssh_pass" {
  type      = string
  sensitive = true
}