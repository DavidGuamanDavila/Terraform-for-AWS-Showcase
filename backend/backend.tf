terraform {
  backend "s3" {
    key = "terraform/tfstate.tfstate"
    bucket = "david-remote-back-2024"
    region = "ca-central-1"
    access_key = "enter credentials"
    secret_key = "enter credentials"
    # use this to find your credentials cat ~/.aws/credentials
  }
}