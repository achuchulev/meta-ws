variable "my_org_name" {
  default = "atanas-free"
}

variable "vcs_identifier" {
  default = "achuchulev/tf-null-count"
}

data "tfe_organization" "org" {
  name = var.my_org_name
}

data "tfe_oauth_client" "client" {
  organization     = var.my_org_name
  service_provider = "github"
}

resource "tfe_workspace" "test" {
  name         = "meta_producer"
  organization = data.tfe_organization.org.name
  tag_names    = ["meta", "workspaces"]

  vcs_repo {
    identifier     = var.vcs_identifier
    oauth_token_id = data.tfe_oauth_client.client.oauth_token_id
  }
}
