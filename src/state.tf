terraform {
  backend "s3" {
    bucket = "aakerber-remote-state"
    key    = "terraform-states/ikano-poc"
    region = "eu-north-1"
  }
}
