variable "kv_name" {
  type = map(object({
    name     = string
    location = string
    rg_name  = string
  }))
}
variable "pipeline_sp_object_id" {
  type        = string
  description = "Service Principal object id used by Azure DevOps pipeline"
}
