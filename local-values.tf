# Mandatory tags 
locals {
  common_tags = {
    App_Name        = "oms"
    Cost_center     = "xyz222"
    Business_unit   = "GBS"
    Project         = "GBS"
    App_role        = "web server"
    Customer        = "students"
    Environment     = "dev"
    Confidentiality = "Restricted"
    Owner           = "dev@jjtechinc.co"
    Opt_in-Opt_out  = "Yes"
    Application_ID  = "197702"
    Compliance      = "pci"
  }
} 