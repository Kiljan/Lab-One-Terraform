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
    addresses      = ["${var.host_master}"]
    wait_for_lease = true
  }

  provisioner "file" {
    source      = var.known_hosts
    destination = "/home/vv/.ssh/known_hosts"

    connection {
      type     = "ssh"
      user     = "vv"
      password = var.vv_password
      host     = var.host_master
    }
  }

  provisioner "file" {
    source      = var.authorized_keys
    destination = "/home/vv/.ssh/authorized_keys"

    connection {
      type     = "ssh"
      user     = "vv"
      password = var.vv_password
      host     = var.host_master
    }
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
    addresses      = ["${var.host_node1}"]
    wait_for_lease = true
  }

  provisioner "file" {
    source      = var.known_hosts
    destination = "/home/vv/.ssh/known_hosts"

    connection {
      type     = "ssh"
      user     = "vv"
      password = var.vv_password
      host     = var.host_node1
    }
  }

  provisioner "file" {
    source      = var.authorized_keys
    destination = "/home/vv/.ssh/authorized_keys"

    connection {
      type     = "ssh"
      user     = "vv"
      password = var.vv_password
      host     = var.host_node1
    }
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
    addresses      = ["${var.host_node2}"]
    wait_for_lease = true
  }

  provisioner "file" {
    source      = var.known_hosts
    destination = "/home/vv/.ssh/known_hosts"

    connection {
      type     = "ssh"
      user     = "vv"
      password = var.vv_password
      host     = var.host_node2
    }
  }

  provisioner "file" {
    source      = var.authorized_keys
    destination = "/home/vv/.ssh/authorized_keys"

    connection {
      type     = "ssh"
      user     = "vv"
      password = var.vv_password
      host     = var.host_node2
    }
  }
}