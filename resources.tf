resource "libvirt_volume" "masterImageName" {
  name   = var.masterImageName
  source = var.stateGoldenImage
  pool   = var.statePool
}

resource "libvirt_volume" "nodeImageName1" {
  name   = var.nodeImageName1
  source = var.stateGoldenImage
  pool   = var.statePool
}

resource "libvirt_volume" "nodeImageName2" {
  name   = var.nodeImageName2
  source = var.stateGoldenImage
  pool   = var.statePool
}
