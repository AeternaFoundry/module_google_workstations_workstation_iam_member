resource "google_workstations_workstation_iam_member" "workstations_workstation_iam_members" {
  for_each = var.workstations_workstation_iam_members

  member                 = each.value.member
  role                   = each.value.role
  workstation_cluster_id = each.value.workstation_cluster_id
  workstation_config_id  = each.value.workstation_config_id
  workstation_id         = each.value.workstation_id
  location               = each.value.location
  project                = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

