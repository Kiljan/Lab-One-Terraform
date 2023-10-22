variable "nodeVcpy" {
  type    = number
  default = 1
}

variable "nodeMemory" {
  type    = number
  default = 1024
}

variable "nodeRunning" {
  type    = bool
  default = true
}

variable "nodeAutostart" {
  type    = bool
  default = false
}

variable "nodeGraphics" {
  type    = string
  default = "vnc"
}

variable "nodeGoldenImage" {
  type    = string
  default = "/var/lib/libvirt/images/centos7.0.qcow2"
}

variable "nodeImageName" {
  type    = string
  default = "centos"
}