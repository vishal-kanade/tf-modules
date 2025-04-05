########################
##  AWS Tag Variables ##
########################


##Mandatory tags##

# locals {
#   is_sap_account = data.aws_caller_identity.current.account_id == "442330622718" || data.aws_caller_identity.current.account_id == "324199248748"
# }

variable "SID" {
  default  = ""
  # nullable = false

  # validation {
  #   condition     = var.SID != "" || !local.is_sap_account
  #   error_message = "The SID must not be empty for SAP AWS accounts 442330622718 or 324199248748."
  # }
}

data "aws_caller_identity" "current" {}

variable "Application" {
  default = ""
  nullable = false

  validation {
    condition     = var.Application != ""
    error_message = "The Application must not be empty. Pls refer the ServiceNow CMDB for the correct value."
  }
}

variable "Division" {
  type = string
  description = "The Division defines the from the IFF Business Unit of which the application belongs to."
  default = ""
  nullable = false

  validation {
    condition     = contains([
      "Scent",
      "Nourish",
      "Health_Biosciences",
      "Pharma_Solutions",
      "Shared_Services"

    ], var.Division)
    error_message = "The Division must be one of the predefined value. Please select one from the list below: \n- Scent,\n- Nourish,\n- Health_Biosciences,\n- Pharma_Solutions,\n- Shared_Services."
  }
}

variable "Function" {
  type = string
  description = "The Function defines the from the IFF Functions of which the application belongs to."
  default = ""
  nullable = false

  validation {
    condition = contains([
      "Finance",
      "Information_Technology",
      "Human_Resources",
      "IR_CorpComm",
      "Legal",
      "Operations",
      "Research_Development",
      "Manufacturing",
      "Quality_Management",
      "Marketing_Sales",
      "Procurement",
      "Plant_Maintenance",
      "Logistics"
    ], var.Function)
    error_message = "The Function must be a predefined value. Please select one from the list below: \n- Finance,\n- Information_Technology,\n- Human_Resources,\n- IR_CorpComm,\n- Legal,\n- Operations,\n- Research_Development,\n- Manufacturing,\n- Quality_Management,\n- Marketing_Sales,\n- Procurement,\n- Plant_Maintenance,\n- Logistics."
  }
}

variable "Department" {
  type = string
  description = "The Department that the resources belong to"
  default = ""
  nullable = false

  validation {
    condition     = contains([
      "Infrastructure",
      "Applications",
      "Data",
      "OT",
      "RnD",
      "SAP",
      "InfoSec"
    ],var.Department)
    error_message = "The Department must be a predefined value. Please select one from the list below: \n- Infrastructure, \n- Applications, \n- Data, \n- OT, \n- RnD, \n- SAP, \n- InfoSec."
  }
}

variable "Environment" {
  type = string
  description = "The Environment that the resources are being deployed"
  default = ""
  nullable = false

  validation {
    condition     = contains([
    "snd",
    "dev",
    "qas",
    "prd"],var.Environment)
    error_message = "The Environment must be a predefined value. Please select one from the list below: \n- snd > Sandbox environments, \n- dev > Development environments, \n- qas > Quality and Staging , \n- prd > Production environment."
  }
}

variable "L1_Technical_Owner" {
  type = string
  description = "The L1_Technical_Owner's email address"
  default = ""
  nullable = false

  validation {
    condition     = can(regex("^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,}$", var.L1_Technical_Owner))
    error_message = "The L1_Technical_Owner must be a valid email address in lowercase."
  }
}

variable "L2_Technical_Owner" {
  type = string
  description = "The L2_Technical_Owner's email address"
  default = ""
  nullable = false

  validation {
    condition     = can(regex("^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,}$", var.L2_Technical_Owner))
    error_message = "The L2_Technical_Owner must be a valid email address in lowercase."
  }
}

variable "L3_IT_Owner" {
  type = string
  description = "The L3_IT_Owner's email address"
  default = ""
  nullable = false

  validation {
    condition     = can(regex("^.*@iff\\.com$", lower(var.L3_IT_Owner)))
    error_message = "The L3_IT_Owner must be an email address from the domain iff.com in lowercase."
  }
}

##Optional tags##

variable "ITLT_Owner" {
  type = string
  description = "The ITLT_Owner email address"
  default = ""
  # nullable = false
  #
  # validation {
  #   condition     = can(regex("^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,}$", var.L1_Technical_Owner))
  #   error_message = "The L1_Technical_Owner must be a valid email address in lowercase."
  # }
}

variable "Business_Owner" {
  description = "The Business Owner's name"
  default = ""
}

variable "DR_Grouping" {
  description = "The Disaster Recovery Grouping"
  default = ""
}

variable "AWS_Service" {
  description = "The AWS Service being used"
  default = ""
}

variable "Backup" {
  description = "The Backup frequency in days"
  default     = "1"

  validation {
    condition     = contains(["0", "1"], var.Backup)
    error_message = "The Backup must be either 0 (no) or 1 (yes)."
  }
}

variable "Retention" {
  description = "The Retention period in days"
  default = "365"
}

variable "Shut_Down" {
  description = "The Shut Down time in hours"
  default = "0"
}

variable "Start_Up" {
  description = "The Start Up time in hours"
  default = ""
}

variable "Operating_System" {
  description = "The Operating System being used"
  default = ""
}

variable "Database" {
  description = "The Database being used"
  default = ""
}

variable "Date_in_Service" {
  description = "The Date the service started"
  default = ""
}

variable "Cost_Center" {
  description = "The Cost Center associated with the service"
  default = ""
}

variable "Project_ID" {
  description = "The Project ID associated with the service"
  default = ""
}

variable "SNOW_RITM" {
  description = "The ServiceNow RITM associated with the service"
  default = ""
}


##AWX template = G8awx###

variable "awx_template_tag" {
  default = ""
}

