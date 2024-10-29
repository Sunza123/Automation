resource "proxmox_vm_qemu" "master01" {
  name        = "master01"
  target_node = var.proxmox_host
  clone       = var.template_name
  desc        = "Master Node"
  full_clone  = true
  agent       = 1
  cores       = 2
  sockets     = 1
  cpu         = "host"
  memory      = 2048
  scsihw      = "virtio-scsi-pci"
  os_type     = "ubuntu"
  bootdisk    = "scsi0"
  ipconfig0 = "192.168.1.20${count.index + 1}/24,gw=192.168.1.245"
  network {
    bridge = var.nic_name
    model  = "virtio"
  }
  disks {
    scsi {
      scsi0 {
        disk {
          storage = "Virtual-Machines"
          size    = 25
        }
      }
    }
  }

  connection {
    type     = "ssh"
    user     = "terraform-prov"
    password = var.ssh_pass
    host     = self.default_ipv4_address
  }
}