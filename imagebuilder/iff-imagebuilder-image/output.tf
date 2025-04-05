output "arn" {
  value = aws_imagebuilder_image.this.arn
}

output "id" {
  value = aws_imagebuilder_image.this.id
}

output "image_id" {
  value = {for i in values({for i,j in aws_imagebuilder_image.this.output_resources:i=>j}):"ami_id"=>[for i in i["amis"]:i["image"]][0]}["ami_id"]
}