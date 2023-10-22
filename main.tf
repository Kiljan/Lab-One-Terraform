# Configure the Libvirt provider
provider "libvirt" {
  uri = "qemu:///system"
}

# Create a new domain
resource "libvirt_domain" "nodeset" {
  name      = "node1"
  vcpu      = var.nodeVcpy
  memory    = var.nodeMemory
  running   = var.nodeRunning
  autostart = var.nodeAutostart

  disk {
    volume_id = libvirt_volume.centos.id
  }

  graphics {
    type = var.nodeGraphics
  }

  network_interface {
    network_id     = libvirt_network.kube_network.id
    addresses      = ["10.17.3.56"]
    wait_for_lease = true
  }
}

resource "libvirt_volume" "centos" {
  name   = var.nodeImageName
  source = var.nodeGoldenImage
}

import {
  to = libvirt_network.kube_network
  id = "e039e4ec-b35f-4f5b-9860-9234236a4aa2"
}

import {
  to = libvirt_domain.nodeset
  id = "6d71757d-0f0f-4be4-adff-4298a7df8ec2"  
}

