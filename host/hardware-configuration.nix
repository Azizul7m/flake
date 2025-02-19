{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules =
    [ "ehci_pci" "ahci" "usb_storage" "sd_mod" "sdhci_pci" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/8f997f52-8798-4364-9af5-3f8b307a5507";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/7C26-8300";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  swapDevices = [{ device = "/dev/disk/by-label/swap"; }];

  #  swapDevices = [{ device = "/dev/disk/by-label/f04a976a-ac27-4573-93f7-b91db177c8ae; }];

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
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    cpu.intel.updateMicrocode =
      lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
