resource "aws_glue_catalog_database" "cstar_landing" {
  name = "cstar_landing"
  description = "Terraform = True, SourceRepository = ${var.source_repository}"
}