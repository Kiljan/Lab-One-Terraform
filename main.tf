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

# Create a new domain 2
resource "libvirt_domain" "nodeset2" {
  name      = "node2"
  vcpu      = var.nodeVcpy
  memory    = var.nodeMemory
  running   = var.nodeRunning
  autostart = var.nodeAutostart

  disk {
    volume_id = libvirt_volume.centos2.id
  }

  graphics {
    type = var.nodeGraphics
  }

  network_interface {
    network_id     = libvirt_network.kube_network.id
    addresses      = ["10.17.3.57"]
    wait_for_lease = true
  }
}
