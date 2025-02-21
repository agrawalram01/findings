include "root" {
  path   = find_in_parent_folders("common.hcl") #this will look for terraform.hcl file in parent directory by default but as we provided file name (c)ommon.hcl) it will look for same 
}

terraform{
    source = "../../..//modules/network" #we have provided double slash to move in module folder after moving to previous directory
    extra_arguments "custom_vars" {
#cmds blocl below contains cmds when executed then only variables in tfvars file will be pass to modules
        commands = [ 
        "apply",
        "plan",
        "import",
        "push",
        "refresh"
        ]

        required_var_files = ["terraform.tfvars"] #path to terraform.tfvars file fromwhere it will take input variables
  }
}

