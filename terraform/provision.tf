resource "proxmox_lxc" "coredns" {
    hostname = "CoreDNS"
    target_node = "uranus"
    ostemplate = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
    password = "terraform"
    start = "true"
    memory = "2048"

    ssh_public_keys = <<-EOT
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE+FSXS0bBdx/+f5CqC1ecoXCg83/drtEnjutFLCf4Ao abc@einsteinium
    EOT

    rootfs {
        storage = "local-lvm"
        size = "2G"
    }
    nameserver = "192.168.10.140"
    network {
        name = "eth0"
        bridge = "vmbr0"
        gw = "192.168.10.1"
        ip = "192.168.10.30/24"
    }
}
