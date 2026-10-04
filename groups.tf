resource "okta_group" "exhibit_a" {
  name        = "Freedom Fighters"
  description = "This is the first mock group"
}

resource "okta_group_memberships" "group_a_membership" {
  group_id = okta_group.exhibit_a.id
  users = [
    okta_user.user_a.id
  ]
}