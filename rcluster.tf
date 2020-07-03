  # Create a new rancher2 RKE Cluster
resource "rancher2_cluster" "app_cluster" {
  name = "application"
  description = "Application Cluster RKE"
  rke_config {
    network {
      plugin = "canal"
    }
  }
}
