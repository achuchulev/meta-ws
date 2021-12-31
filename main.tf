data "tfe_organization" "free" {
  name = "atanas-b"
}

output "org-id" {
  value = data.tfe_organization.free.external_id
}

resource "tfe_team" "test" {
  name         = "my-test-team"
  organization = data.tfe_organization.free.name
}
