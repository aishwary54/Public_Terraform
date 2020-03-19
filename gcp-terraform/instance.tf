resource "google_compute_instance" "default" {
  name         = "${var.instance_name}"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

 

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }


  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata_startup_script ="sudo apt-get -y update;sudo apt-get -y install nginx;sudo echo '<h1>Welcome aishwary</h1>' >/usr/share/nginx/html/index.html;sudo service nginx start;"

  service_account {
    scopes = ["cloud-platform"]
  }
}
   
