resource "google_compute_instance" "db" {
  name         = var.db_machine_name
  machine_type = var.type_machine
  zone         = var.zones
  tags         = ["reddit-db"]
  # определение загрузочного диска  
  boot_disk {
    initialize_params {
      image = var.db_disk_image
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
    access_config {}
  }
}
resource "google_compute_firewall" "firewall_mongo" {
  name = "allow-mongo-default"
  # Название сети, в которой действует правило
  network = "default"
  # Какой доступ разрешить
  allow {
    protocol = "tcp"
    ports    = ["27017"]
  }
  # Каким адресам разрешаем доступ
  target_tags = ["reddit-db"]
  # Правило применимо для инстансов с тегом …
  source_tags = ["reddit-app"]
}
