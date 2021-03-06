resource "google_compute_instance" "app" {
  name         = "${var.app_machine_name}"
  machine_type = "${var.type_machine}"
  zone         = "${var.zones}"
  tags         = ["reddit-app"]
  # определение загрузочного диска  
  boot_disk {
    initialize_params {
      image = "${var.app_disk_image}"
    }
  }
  metadata = {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }
  # определение сетевого интерфейса
  network_interface {
    # сеть, к которой присоединить данный интерфейс
    network = "default"
    # использовать ephemeral IP для доступа из Интернет
    access_config {
      nat_ip = "${google_compute_address.app_ip.address}"
    }
  }
}
resource "google_compute_firewall" "firewall_puma" {
  name = "allow-puma-default"
  # Название сети, в которой действует правило
  network = "default"
  # Какой доступ разрешить
  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }
  # Каким адресам разрешаем доступ
  source_ranges = ["0.0.0.0/0"]
  # Правило применимо для инстансов с тегом …
  target_tags = ["reddit-app"]
}
resource "google_compute_address" "app_ip" {
  name = "reddit-app-ip"
}

