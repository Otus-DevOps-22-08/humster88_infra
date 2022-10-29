locals {
  instance_internal_ip = yandex_compute_instance.app.*.network_interface.0.ip_address
}

resource "yandex_lb_target_group" "app" {
  name      = "app"
#  target {
#    subnet_id = var.subnet_id
#    address   = "${yandex_compute_instance.app.0.network_interface.0.ip_address}"
#  }
#  target {
#    subnet_id = var.subnet_id
#    address   = "${yandex_compute_instance.app.1.network_interface.0.ip_address}"
#  }
  dynamic "target" {
    for_each = local.instance_internal_ip
    content {
      subnet_id = var.subnet_id
      address   = target.value
    }
  }
}

resource "yandex_lb_network_load_balancer" "lb" {
  name = "loadbalancer"
  listener {
    name = "listen"
    port = 80
    target_port = 9292
    external_address_spec {
      ip_version = "ipv4"
    }
  }
  attached_target_group {
    target_group_id = "${yandex_lb_target_group.app.id}"
    healthcheck {
      name = "http"
        http_options {
          port = 9292
          path = "/"
        }
    }
  }
}

data "yandex_lb_network_load_balancer" "lbspec" {
  network_load_balancer_id = yandex_lb_network_load_balancer.lb.id
}
