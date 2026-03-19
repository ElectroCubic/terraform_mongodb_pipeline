
# Anush Bundel 2023BCS0005

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_pod_v1" "mongodb" {
  metadata {
    name = "mongodb-pod-2023bcs0005"
    labels = {
      app = "mongodb"
    }
  }

  spec {
    container {
      name  = "mongodb-container-2023bcs0005"
      image = "mongo"

      port {
        container_port = 27017
      }
    }
  }
}

resource "kubernetes_service_v1" "mongodb_service" {
  metadata {
    name = "mongodb-service"
  }

  spec {
    selector = {
      app = "mongodb"
    }

    port {
      port        = 27017
      target_port = 27017
    }

    type = "ClusterIP"
  }
}
