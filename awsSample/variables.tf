variable "ports" {
  type = list(number)
  #   default = [22, 80, 443, 3306, 27017]
}

variable "image_id" {
  type = string
}

variable "instance_type" {
  type = string
}

##take this from external file or env variable
# variable "access_key" {
#   type = string
# }

# variable "secret_key" {
#   type = string
# }

variable "image_name" {
  type = string
}