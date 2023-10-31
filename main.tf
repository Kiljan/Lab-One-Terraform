# Configure the Libvirt provider
provider "libvirt" {
  uri = "qemu:///system"
}

resource "libvirt_domain" "nodeset" {
  name      = "master"
  vcpu      = var.masterVcpu
  memory    = var.masterMemory
  running   = var.stateRunning
  autostart = var.stateAutostart

  disk {
    volume_id = libvirt_volume.masterImageName.id
  }

  graphics {
    type = var.stateGraphics
  }

  network_interface {
    network_id     = libvirt_network.kube_network.id
    addresses      = ["10.17.3.56"]
    wait_for_lease = true
  }
}

resource "libvirt_domain" "nodeset1" {
  name      = "node1"
  vcpu      = var.nodeVcpu
  memory    = var.nodeMemory
  running   = var.stateRunning
  autostart = var.stateAutostart

  disk {
    volume_id = libvirt_volume.nodeImageName1.id
  }

  graphics {
    type = var.stateGraphics
  }

  network_interface {
    network_id     = libvirt_network.kube_network.id
    addresses      = ["10.17.3.57"]
    wait_for_lease = true
  }
}

resource "libvirt_domain" "nodeset2" {
  name      = "node2"
  vcpu      = var.nodeVcpu
  memory    = var.nodeMemory
  running   = var.stateRunning
  autostart = var.stateAutostart

  disk {
    volume_id = libvirt_volume.nodeImageName2.id
  }

  graphics {
    type = var.stateGraphics
  }

  network_interface {
    network_id     = libvirt_network.kube_network.id
    addresses      = ["10.17.3.58"]
    wait_for_lease = true
  }
}