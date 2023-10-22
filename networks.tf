resource "libvirt_network" "kube_network" {
  # the name used by libvirt
  name = "k8snet"

  # mode can be: "nat" (default), "none", "route", "open", "bridge"
  mode = "nat"

  #  the domain used by the DNS server in this network
  domain = "k8s.local"

  #  list of subnets the addresses allowed for domains connected
  # also derived to define the host addresses
  # also derived to define the addresses served by the DHCP server
  addresses = ["10.17.3.0/24"]

  autostart = true

  dns {
    hosts {
      hostname = "localhost"
      ip       = "10.17.3.1"
    }
  }

  dhcp {
    enabled = true
  }

  lifecycle {
    ignore_changes = all
    prevent_destroy = true
  }

}