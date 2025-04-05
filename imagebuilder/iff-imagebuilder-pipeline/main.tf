resource "aws_imagebuilder_image_pipeline" "this" {
  image_recipe_arn                 = var.image_recipe_arn
  infrastructure_configuration_arn = var.infrastructure_configuration_arn
  name                             = var.imagebuilder_pipeline_name
  distribution_configuration_arn   = var.distribution_configuration_arn
  tags                             = var.pipeline_tags
  description                      = var.pipeline_description
  image_tests_configuration {
    image_tests_enabled = var.image_tests_configuration.image_tests_enabled
    timeout_minutes     = var.image_tests_configuration.timeout_minutes
  }
  status = var.status
}
