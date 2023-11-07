# Infrastructure as a code

## Virtual Machines creation via terraform and libvirt provider

Use this repository, create a new Jenkins pipeline and run it. I use the localhost agent for this purpose (MAIN_terraformstart).

In this project's "files" folder, you must provide authorized_keys and known_hosts with the correct permissions (terraform inherits permissions from these files when running).

Excluded creds.tf file contains:

```
variable "vv_password" {
  type    = string
  default = "my_secret_password"
}

variable "host_master" {
  type    = string
  default = "10.17.3.56"
}

variable "host_node1" {
  type    = string
  default = "10.17.3.57"
}

variable "host_node2" {
  type    = string
  default = "10.17.3.58"
}

variable "known_hosts" {
  type    = string
  default = "/home/vv/terraform/files/known_hosts"
}

variable "authorized_keys" {
  type    = string
  default = "/home/vv/terraform/files/authorized_keys"
}
```

This is part of a short series of articles from my Linkedin profile:  https://www.linkedin.com/pulse/devops-labs-free-part-1-piotr-kiljanek-njgof