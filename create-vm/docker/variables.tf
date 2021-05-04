variable "nutanix-endpoint" {
  type        = string
  description = "Nutanix server IP"
  default = "161.84.188.20"
}

variable "vm-count" {
  type        = string
  description = "Number of VMs needed"
  default = 3
}

variable "vm-name-prefix" {
  type        = string
  description = "Name prefix to VMs" 
}

variable "nutanix-insecure" {
  type        = string
  description = "Is the connection to Nutanix Prism insecure (true/false)"
  default = true
}

variable "nutanix-project-uuid" {
  type        = string
  description = "Project UUID"
  default = "65c0df7b-689e-4c70-b083-c5a2665764d2"
}

variable "nutanix-image-uuid" {
  type        = string
  description = "Image UUID"
  default = "dc6a4046-513b-4894-9aa2-3680310e224a"
}

variable "nutanix-subnet-uuid" {
  type        = string
  description = "Subnet UUID"
  default = "fb4f5188-861a-4b65-8b20-6a02acf05635"
}

variable "nutanix-cluster-uuid" {
  type        = string
  description = "cluster UUID"
  default = "0005a6f4-6172-0a67-0240-ac1f6b3bbebf"
}

variable "nutanix-userName" {
  type        = string
  description = "Nutanix user name"  
}

variable "nutanix-password" {
  type        = string
  description = "Nutanix password" 
}

