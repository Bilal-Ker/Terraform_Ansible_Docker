resource "opennebula_virtual_machine" "web" {

  template_id = data.opennebula_template.plantilla.id

  name = "debian-${var.opennebula_username}-web"

  cpu    = 2
  vcpu   = 2
  memory = 6000
  group  = var.opennebula_username

  context = {
    NETWORK      = "YES"
    SET_HOSTNAME = "$NAME"
    SSH_PUBLIC_KEY = file("~/.ssh/id_rsa.pub")
  }

  nic {
    model      = "virtio"
    network_id = data.opennebula_virtual_network.red.id
    ip         = "172.20.227.60"
  }

  disk {
    image_id = data.opennebula_template.plantilla.disk[0].image_id
    target   = "vda"
    size     = 6000
  }
}

resource "opennebula_virtual_machine" "mysql" {

  template_id = data.opennebula_template.plantilla.id

  name = "debian-${var.opennebula_username}-mysql"

  cpu    = 2
  vcpu   = 2
  memory = 6000
  group  = var.opennebula_username

  context = {
    NETWORK      = "YES"
    SET_HOSTNAME = "$NAME"
    SSH_PUBLIC_KEY = file("~/.ssh/id_rsa.pub")
  }

  nic {
    model      = "virtio"
    network_id = data.opennebula_virtual_network.red.id
    ip         = "172.20.227.61"
  }

  disk {
    image_id = data.opennebula_template.plantilla.disk[0].image_id
    target   = "vda"
    size     = 6000
  }
}
