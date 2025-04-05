# Terraform AWS Tag Variables Project

This project manages AWS Tag Variables using Terraform.

## Example Usage
To use this project as a module in your Terraform code, use the following block:

```hcl
module "aws_tag_variables" {
  source              = "git::ssh://git@gitlab.com/danisco-nutrition-and-biosciences/iff-cloud-engineering/iff-terraform-core-modules/iff-tags.git"

  // Mandatory Tags
  Application         = "MyApp"
  Division            = "Scent"
  Function            = "Finance"
  Department          = "HR"
  Environment         = "Prod"
  L1_Technical_Owner  = "l1@example.com"
  L2_Technical_Owner  = "l2@example.com"
  L3_IT_Owner         = "l3@example.com"

  // Optional Tags
  ITLT_Owner          = "itlt@example.com"
  Business_Owner      = "business@example.com"
  DR_Grouping         = "Group1"
  AWS_Service         = "EC2"
  Backup              = "7"
  Retention           = "30"
  Shut_Down           = "0"
  Start_Up            = "8"
  Operating_System    = "Linux"
  Database            = "MySQL"
  Date_in_Service     = "2022-01-01"
  Cost_Center         = "CC1"
  Project_ID          = "PID1"
  SNOW_RITM           = "RITM1"
  awx_template_tag    = "tag1"
}
```

## Variables
The following variables are used in this project:

| Tag Type           | Tag Name             | Description                                                                                                                                                   | Accepted Values                                                                                                                                                                                                                 |
|--------------------|----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Mandatory Tags** | `Application`        | Name of the application as per ServiceNow CMDB.                                                                                                               | Any non-empty string                                                                                                                                                                                                            |
|                    | `Division`           | Division from the IFF BU's.                                                                                                                                   | "Scent", "Nourish", "Health_Biosciences", "Pharma_Solutions", "Shared_Services"                                                                                                                                                 |
|                    | `Function`           | Function from the IFF Functions.                                                                                                                              | "Finance", "Information_Technology", "Human_Resources", "IR_CorpComm", "Legal", "Operations", "Research_Development", "Manufacturing", "Quality_Management", "Marketing_Sales", "Procurement", "Plant_Maintenance", "Logistics" |
|                    | `Department`         | Department that the resources belong to.                                                                                                                      | "Infrastructure", "Applications", "Data", "OT", "RnD", "SAP", "InfoSec"                                                                                                                                                         |
|                    | `Environment`        | Environment that the resources are being deployed.                                                                                                            | "snd", "dev", "qas", "prd"                                                                                                                                                                                                      |
|                    | `L1_Technical_Owner` | L1 Technical Owner's(This tag represents a distribution list or specific point of contact that should receive notifications regarding alerts.) email address. | Any valid email address in lowercase                                                                                                                                                                                            |
|                    | `L2_Technical_Owner` | L2 Technical Owner's(This designation specifies the point of contact who should be informed about significant service impacts or changes) email address.      | Any valid email address in lowercase                                                                                                                                                                                            |
|                    | `L3_IT_Owner`        | L3 IT Owner's(report to the ITLT Owner for inquiries related to cost show back within the ITLT) email address.                                                | Any email address from the domain iff.com in lowercase                                                                                                                                                                          |
| **Optional Tags**  | `Business_Owner`     | Business Owner's name.                                                                                                                                        | Any string                                                                                                                                                                                                                      |
|                    | `DR_Grouping`        | Disaster Recovery Grouping.                                                                                                                                   | Any string                                                                                                                                                                                                                      |
|                    | `AWS_Service`        | AWS Service being used.                                                                                                                                       | Any string                                                                                                                                                                                                                      |
|                    | `Backup`             | Backup frequency in days.                                                                                                                                     | Any string representing a number                                                                                                                                                                                                |
|                    | `Retention`          | Retention period in days.                                                                                                                                     | Any string representing a number                                                                                                                                                                                                |
|                    | `Shut_Down`          | Shut Down time in hours.                                                                                                                                      | Any string representing a number                                                                                                                                                                                                |
|                    | `Start_Up`           | Start Up time in hours.                                                                                                                                       | Any string                                                                                                                                                                                                                      |
|                    | `Operating_System`   | Operating System being used.                                                                                                                                  | Any string                                                                                                                                                                                                                      |
|                    | `Database`           | Database being used.                                                                                                                                          | Any string                                                                                                                                                                                                                      |
|                    | `Date_in_Service`    | Date the service started.                                                                                                                                     | Any string                                                                                                                                                                                                                      |
|                    | `Cost_Center`        | Cost Center associated with the service.                                                                                                                      | Any string                                                                                                                                                                                                                      |
|                    | `Project_ID`         | Project ID associated with the service.                                                                                                                       | Any string                                                                                                                                                                                                                      |
|                    | `SNOW_RITM`          | ServiceNow RITM associated with the service.                                                                                                                  | Any string                                                                                                                                                                                                                      |
|                    | `awx_template_tag`   | AWX template tag.                                                                                                                                             | Any string                                                                                                                                                                                                                      |



| Tag Type           | Tag Name | Description             | Accepted Values      |
|--------------------|----------|-------------------------|----------------------|
| **Mandatory Tags** | `SID`    | For SAP resources only. | Any non-empty string |