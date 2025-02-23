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
  os_type     = "cloud-init"
  bootdisk    = "scsi0"
  ipconfig0   = "ip=192.168.1.201/24"
  
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
          emulatessd = true
        }
      }
    }
  }

  connection {
    type     = "ssh"
    user     = var.proxmox_tf_user
    password = var.proxmox_tf_pass
    host     = self.default_ipv4_address
  }
}
