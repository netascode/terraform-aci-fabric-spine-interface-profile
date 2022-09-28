terraform {
  required_version = ">= 1.0.0"

  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
}

module "main" {
  source = "../.."

  name = "SPINE1001"
}

data "aci_rest_managed" "fabricSpPortP" {
  dn = "uni/fabric/spportp-${module.main.name}"

  depends_on = [module.main]
}

resource "test_assertions" "fabricSpPortP" {
  component = "fabricSpPortP"

  equal "name" {
    description = "name"
    got         = data.aci_rest_managed.fabricSpPortP.content.name
    want        = module.main.name
  }
}
