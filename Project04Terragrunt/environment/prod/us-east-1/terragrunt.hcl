terraform{
    source = "../../../modules/network"
    extra_arguments "custom_vars" {
#cmds blocl below contains cmds when executed then only variables in tfvars file will be pass to modules
        commands = [ 
        "apply",
        "plan",
        "import",
        "push",
        "refresh"
        ]

        required_var_files = ["terraform.tfvars"] #path to terraform.tfvars file
  }
}

