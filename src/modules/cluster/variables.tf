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
}
