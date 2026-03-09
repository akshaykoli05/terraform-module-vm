variable "vm_name" {}
variable "vm_size" {}
variable "location" {}
variable "rg_name" {}
variable "nic_id" {}
variable "os_type" {
  description = "Operating system type (Linux/Windows)"
}
variable "vm_suffix" {
  description = "Numeric suffix for VM name (e.g., 01, 02)"
}