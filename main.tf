resource "aci_rest" "fabricSpPortP" {
  dn         = "uni/fabric/spportp-${var.name}"
  class_name = "fabricSpPortP"
  content = {
    name = var.name
  }
}
