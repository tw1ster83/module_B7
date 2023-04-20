terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "s3-tw1ster"
    region     = "ru-central1"
    key        = "terraform/terraform.tfstate"
    access_key = "YCAJESceFjMvSCAJUBWbIVuQU"
    secret_key = "YCPLF7lRodvKLFjEtWd3akKLxD6qPOPxnAhZaCjt"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

provider "yandex" {
  token     = "y0_AgAAAAABx1chAATuwQAAAADfs4ySOOxl54A6SI-9OnIR1Z1hzsoeOnk"
  cloud_id  = "b1grgrnnvprgj2dft57t"
  folder_id = "b1gco8k5puof1l85vt78"
  zone      = "ru-central1-a"
}
data "yandex_compute_image" "ubuntu_image" {
  family = "ubuntu-2004-lts"
}

data "yandex_compute_image" "centos_image" {
  family = "centos-stream-8"
}

resource "yandex_compute_instance" "vm1" {
  name = "vm1"
  zone = "ru-central1-a"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_image.id
      size = 20
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

metadata = {
  user-data = "#cloud-config\nusers:\n  - name: root\n    groups: sudo\n    shell: /bin/bash\n    sudo: ['ALL=(ALL) NOPASSWD:ALL']\n    ssh-authorized-keys:\n      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDqnqJuCYpHzCyDnecHx2mYJ/bDJOMw1vvJlzt0W1F36RM8rq9wnsNJh9WdSSppGZUjgbIXPcUsqeCRwVHMyIYVvTtM8AIitLi5pcFS26g7MklBswlJmGwgzQ8JXeXTHumo1ELRvqRLZld/hWjtXTevbPoXV6CPBnRGscogyq0IcTu/RhWtGiMesx/YgeLPY9esWxpFdRG5lWYnj9BhQT19lRIRhO4VBQ2YT9UbFZrY0Nam7l1qwGiMa5Ao872lOhAZHGTWz1cMoXRBGJP/MNccLJ4ZHB+sNCavjZZumw4FbCv+yCQDRBWidw207x4Rr4Prq9G2KXj2HPd59Acv3a8D6jdyLLhAj4tTZNlUAIMf7BQsuhKnDU49+ZlGbpWv4X59VV877ULOqHk5F7d63M/E/n7S2sQDGWPoi9RAkNe2ZhGOrpHVlfqn6sVxEuMEXlNbQiwur60wpa67UnR0I2OnZGQOd7/TmBTicFpNCtF0r/ze8ee4m0rYmlrddp6SDvE= СЃРµРјСЊСЏ@tw1ster-nout"
}
}

resource "yandex_compute_instance" "vm2" {
  name = "vm2"
  zone = "ru-central1-a"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_image.id
      size = 20
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

metadata = {
  user-data = "#cloud-config\nusers:\n  - name: root\n    groups: sudo\n    shell: /bin/bash\n    sudo: ['ALL=(ALL) NOPASSWD:ALL']\n    ssh-authorized-keys:\n      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDqnqJuCYpHzCyDnecHx2mYJ/bDJOMw1vvJlzt0W1F36RM8rq9wnsNJh9WdSSppGZUjgbIXPcUsqeCRwVHMyIYVvTtM8AIitLi5pcFS26g7MklBswlJmGwgzQ8JXeXTHumo1ELRvqRLZld/hWjtXTevbPoXV6CPBnRGscogyq0IcTu/RhWtGiMesx/YgeLPY9esWxpFdRG5lWYnj9BhQT19lRIRhO4VBQ2YT9UbFZrY0Nam7l1qwGiMa5Ao872lOhAZHGTWz1cMoXRBGJP/MNccLJ4ZHB+sNCavjZZumw4FbCv+yCQDRBWidw207x4Rr4Prq9G2KXj2HPd59Acv3a8D6jdyLLhAj4tTZNlUAIMf7BQsuhKnDU49+ZlGbpWv4X59VV877ULOqHk5F7d63M/E/n7S2sQDGWPoi9RAkNe2ZhGOrpHVlfqn6sVxEuMEXlNbQiwur60wpa67UnR0I2OnZGQOd7/TmBTicFpNCtF0r/ze8ee4m0rYmlrddp6SDvE= СЃРµРјСЊСЏ@tw1ster-nout"
}
}

resource "yandex_compute_instance" "vm3" {
  name = "vm3"
  zone = "ru-central1-a"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.centos_image.id
      size = 20
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

metadata = {
  user-data = "#cloud-config\nusers:\n  - name: root\n    groups: sudo\n    shell: /bin/bash\n    sudo: ['ALL=(ALL) NOPASSWD:ALL']\n    ssh-authorized-keys:\n      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDqnqJuCYpHzCyDnecHx2mYJ/bDJOMw1vvJlzt0W1F36RM8rq9wnsNJh9WdSSppGZUjgbIXPcUsqeCRwVHMyIYVvTtM8AIitLi5pcFS26g7MklBswlJmGwgzQ8JXeXTHumo1ELRvqRLZld/hWjtXTevbPoXV6CPBnRGscogyq0IcTu/RhWtGiMesx/YgeLPY9esWxpFdRG5lWYnj9BhQT19lRIRhO4VBQ2YT9UbFZrY0Nam7l1qwGiMa5Ao872lOhAZHGTWz1cMoXRBGJP/MNccLJ4ZHB+sNCavjZZumw4FbCv+yCQDRBWidw207x4Rr4Prq9G2KXj2HPd59Acv3a8D6jdyLLhAj4tTZNlUAIMf7BQsuhKnDU49+ZlGbpWv4X59VV877ULOqHk5F7d63M/E/n7S2sQDGWPoi9RAkNe2ZhGOrpHVlfqn6sVxEuMEXlNbQiwur60wpa67UnR0I2OnZGQOd7/TmBTicFpNCtF0r/ze8ee4m0rYmlrddp6SDvE= СЃРµРјСЊСЏ@tw1ster-nout"
}
}

resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

