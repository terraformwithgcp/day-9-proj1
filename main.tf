resource "google_compute_network" "net1" {
    name                    = "custom-network-here"
    auto_create_subnetworks = false
  
}
resource "google_storage_bucket" "bucket2" {
    name     = "importbucket1himanshuusestbuckethfhfhfhfh"
    location = "US"
    provider = google.acc2
}
resource "google_compute_firewall" "fire1" {
    name    = "allow-http-https"
    network = "default"

    allow {
      protocol = "tcp"
      ports    = ["22","80", "443"]
    }

    source_ranges = ["0.0.0.0/0"]
    target_tags = ["myvm"]
  
}




resource "google_compute_instance" "inst1" {
    name         = "vm1"
    machine_type = "f1-micro"
    zone         = "us-central1-a"

    boot_disk {
      initialize_params {
        image = "debian-cloud/debian-11"
      }
    }
    tags = ["myvm"]

    network_interface {
      network = "default"

      access_config {
        // Ephemeral public IP
      }
    }

    metadata = {
      ssh-keys = "himanshu:${file("~/.ssh/id_rsa.pub")}"
    }
    provisioner "file" {
        source      = "start.sh"
        destination = "/tmp/start.sh"
        connection {
            type        = "ssh" 
            user        = "himanshu"
            private_key = file("~/.ssh/id_rsa")
            host        = self.network_interface[0].access_config[0].nat_ip
          
        }
      
    }
    provisioner "remote-exec" {
        inline = [ "echo hello > /tmp/hello.txt"]
        connection {
            type        = "ssh" 
            user        = "himanshu"
            private_key = file("~/.ssh/id_rsa")
            host        = self.network_interface[0].access_config[0].nat_ip
          
        }
      
    }






    provisioner "local-exec" {
        command = "echo Instance ${self.name} created in zone ${self.zone}"
      
    }
  
}