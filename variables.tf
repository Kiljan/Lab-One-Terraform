variable "masterVcpu" {
  type    = number
  default = 2
}

variable "nodeVcpu" {
  type    = number
  default = 1
}

variable "masterMemory" {
  type    = number
  default = 4096
}

variable "nodeMemory" {
  type    = number
  default = 2048
}

variable "statePool" {
  type    = string
  default = "pool"
}

variable "stateRunning" {
  type    = bool
  default = true
}

variable "stateAutostart" {
  type    = bool
  default = false
}

variable "stateGraphics" {
  type    = string
  default = "vnc"
}

variable "stateGoldenImage" {
  type    = string
  default = "/home/vv/pool/centos7Golden.qcow2"
}

variable "masterImageName" {
  type    = string
  default = "centosmaster"
}
variable "nodeImageName1" {
  type    = string
  default = "centosnode1"
}
