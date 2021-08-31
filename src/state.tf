terraform {
  backend "s3" {
    bucket = "aakerber-remote-state"
    key    = "terraform-states/poc"
    region = "eu-north-1"
  }
}
