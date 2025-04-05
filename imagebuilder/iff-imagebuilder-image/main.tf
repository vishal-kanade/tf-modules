resource "aws_imagebuilder_image" "this" {
  distribution_configuration_arn   = var.distribution_configuration_arn
  image_recipe_arn                 = var.image_recipe_arn
  timeouts {
    create = var.create_timeout
  }
  infrastructure_configuration_arn = var.infrastructure_configuration_arn
  tags                             = var.tags
}
