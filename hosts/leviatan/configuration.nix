{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./stylix.nix
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../nixosModules/hosts.nix
    ../../nixosModules/nh.nix
    ../../nixosModules/locale.nix
    ../../nixosModules/sound.nix
    ../../nixosModules/fonts.nix
    ../../nixosModules/graphics.nix
    ../../nixosModules/xdg.nix
    ../../nixosModules/sessionVariables.nix
    ../../nixosModules/windowManager
    ../../nixosModules/gdm.nix
  ];

  # Bootloader.

  boot.loader.grub = {
    enable = true;
    devices = ["nodev"];
    useOSProber = true;
    efiSupport = true;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  boot.plymouth.enable = true;
  #boot.plymouth.theme = "bgrt";

  networking.hostName = "leviatan"; # Define your hostname.eeeo
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.

  # Experimental flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  programs.zsh.enable = true;

  users.users.thanajor = {
    isNormalUser = true;
    description = "Thanajor";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
    packages = with pkgs; [
    ];
  };

  services.logind.extraConfig = ''
    HandleLidSwitch=ignore
  '';

  # Enable automatic login for the user.
  services.getty.autologinUser = "thanajor";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).

  system.stateVersion = "24.05"; # Did you read the comment?
}
