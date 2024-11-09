{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules =
    [ "ehci_pci" "ahci" "usb_storage" "sd_mod" "sdhci_pci" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/4c55dc45-bc69-4e20-ab61-cd49581dfb6d";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/7026-1DC1";
    fsType = "vfat";
  };
  swapDevices = [{ device = "/dev/disk/by-label/swap"; }];
  #HDD

  fileSystems."/home" = {
    device = "/dev/disk/by-label/home";
    fsType = "ext4";
  };
  fileSystems."/home/anower/Soft_Tuto" = {
    device = "/dev/disk/by-label/Soft_Tuto";
    fsType = "ntfs-3g";
    options = [ "defaults" "uid=1000,gid=1000" ];
  };
  fileSystems."/home/anower/Projects" = {
    device = "/dev/disk/by-label/Projects";
    fsType = "ntfs-3g";
    options = [ "defaults" "uid=1000,gid=1000" ];
  };
  fileSystems."/home/anower/Entertainment" = {
    device = "/dev/disk/by-label/Entertainment";
    fsType = "ntfs-3g";
    options = [ "defaults" "uid=1000,gid=1000" ];
  };

  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eno1.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp2s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware = {
    #graphics = {
      #enable = true;
      #enable32Bit = true;
    #};
    cpu.intel.updateMicrocode =
      lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
