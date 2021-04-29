terraform {
  required_providers {
    nutanix = {
      source = "nutanix/nutanix"
    }
  }
}

provider "nutanix" {
  endpoint = var.nutanix-endpoint
  insecure = var.nutanix-insecure
  username = var.nutanix-userName
  password = var.nutanix-password
}


resource "nutanix_virtual_machine" "vm1" {
  count = 3
  name = "test-PerfVM-${count.index}"
  cluster_uuid = var.nutanix-cluster-uuid
  num_vcpus_per_socket = 1
  num_sockets          = 1
  memory_size_mib      = 2048

  project_reference = {
      kind = "project"
      uuid = var.nutanix-project-uuid
  }

  disk_list {
    data_source_reference = {
          kind = "image"
          uuid = var.nutanix-image-uuid
     }
  }

  nic_list {
    subnet_uuid = var.nutanix-subnet-uuid
  }


}