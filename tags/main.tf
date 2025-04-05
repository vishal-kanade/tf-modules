locals {
  tags = {
      Application         = var.Application
      Division            = var.Division
      Functions           = var.Function
      Environment         = var.Environment
      Department          = var.Department
      L1_Technical_Owner  = var.L1_Technical_Owner
      L2_Technical_Owner  = var.L2_Technical_Owner
      L3_IT_Owner         = var.L3_IT_Owner
      SID                 = var.SID
      ITLT_Owner          = var.ITLT_Owner
      Operating_System    = var.Operating_System
      Project_ID          = var.Project_ID
      Business_Owner      = var.Business_Owner
      Start_Up            = var.Start_Up
      Shut_Down           = var.Shut_Down
      Backup              = var.Backup
      Retention           = var.Retention
      Database            = var.Database
      Date_in_Service     = var.Date_in_Service
      Cost_Center         = var.Cost_Center
      SNOW_RITM           = var.SNOW_RITM
      DR_Grouping         = var.DR_Grouping
      AWS_Service         = var.AWS_Service
      AWX_Template        = var.awx_template_tag




    } 

  asgtags = [for k, v in local.tags : {
      key                 = k
      value               = v
      propagate_at_launch = true
    }]
}