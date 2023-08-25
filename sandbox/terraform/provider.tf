terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.22"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 3.4.0"
    }
  }
  
}

provider "cloudflare" {
  email   = "renzo_3011@hotmail.com.com"
  api_key = var.cloudflare_api_key
}
