variable "my_org_name" {
  default = "atanas-free"
}

data "tfe_organization" "org" {
  name = var.my_org_name
}

resource "tfe_workspace" "test" {
  name         = "meta_producer"
  organization = data.tfe_organization.org.name
  tag_names    = ["meta", "workspaces"]
}
