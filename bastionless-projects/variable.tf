variable "regions" {
  type = string
}
variable "zones" {
  type = list(any)
}
variable "vpc_cidrs" {
  type = string
}
variable "publicsbnts" {
  type = list(any)
}
variable "privatesbnts" {
  type = list(any)
}
variable "ports" {
  type = list(any)
}
variable "tags1" {
  type = list(any)
}
variable "tags2" {
  type = list(any)
}

variable "routetable1tags" {
  type = map(any)
}
variable "routetable2tags" {
  type = map(any)
}
variable "vpctags1" {
  type = string
}
variable "tools" {
  type = map(any)
}

