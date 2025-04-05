resource "aws_cloudwatch_event_rule" "example_event_rule" {
  name          = var.eventrule_name
  description   = var.eventrule_description
#  state         = var.eventrule_state
  event_pattern = var.event_pattern

#<<PATTERN
#
#{
#  "source": ["aws.ec2"],
#  "detail-type": ["EC2 Instance State-change Notification"],
#  "detail": {
#    "state": ["running"]
#  }
#}
#PATTERN
tags = var.tags
}

resource "aws_cloudwatch_event_target" "example_target" {
  rule      = aws_cloudwatch_event_rule.example_event_rule.name
  arn       = var.target_arn
}