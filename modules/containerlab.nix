{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.containerlab ];

  users.groups.clab_admins = { };

  # containerlab needs to manipulate network namespaces; wrap it setuid
  # and gate it behind the clab_admins group instead of running it as root.
  security.wrappers = {
    containerlab = {
      source = "${pkgs.containerlab}/bin/containerlab";
      owner = "root";
      group = "clab_admins";
      setuid = true;
      permissions = "u+rx,g+x";
    };
    clab = {
      source = "${pkgs.containerlab}/bin/containerlab";
      owner = "root";
      group = "clab_admins";
      setuid = true;
      permissions = "u+rx,g+x";
    };
  };
}
