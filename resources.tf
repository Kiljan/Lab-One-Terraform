resource "libvirt_volume" "centos" {
  name   = var.nodeImageName
  source = var.nodeGoldenImage
}

resource "libvirt_volume" "centos2" {
  name   = var.nodeImageName2
  source = var.nodeGoldenImage
}