variable "rg_name" {
  default     = "Trunk"
  description = "Resource group name"
}

variable "custom_location" {
  default     = "East US"
  description = "Resource group location and other's location"

}

variable "vnet_addr" {
  default     = ["192.168.0.0/16"]
  description = "vnet address"
}

variable "tags" {
  default = {
    department = "Operations"
    env        = "training"
  }
  description = "Common tags"
}
