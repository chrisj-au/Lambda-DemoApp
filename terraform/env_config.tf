locals {
    # Load environment based settings
    tfsettingsfile = "./env/${terraform.workspace}/tfsettings.yaml"
    tfsettingsfilecontent = fileexists(local.tfsettingsfile) ? file(local.tfsettingsfile) : "MissingTFSettingsFile: true"
    # Load default settings
    tfdefaultsettings = yamldecode(file("./env/_default.yaml"))
    tfworkspacesettings = yamldecode(local.tfsettingsfilecontent)
    # Merge configuration
    tfsettings = merge(local.tfdefaultsettings, local.tfworkspacesettings)
}