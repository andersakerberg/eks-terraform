variable "aws" {

  type = object({
    region = string
    eks = object({
      name    = string
      version = string
    })
    network = object({
      name = string
    })

  })

  default = {
    region = "eu-north-1"
    eks = {
      name = "aakerber-test-spot"
      version = "1.21"
    }
    network = {
      name = "aakerber-net"
    }
  }

}
