# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # powerManagement.cpuFreqGovernor = "performance"; 
  # Often used values: “ondemand”, “powersave”, “performance”

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/disk/by-id/usb-SanDisk_Cruzer_Blade_04016411121821040705-0:0";
  boot.loader.grub.useOSProber = true;
  #boot.kernelParams = [ "nomodeset" ];
  services.xserver.videoDrivers = [
    # "amdgpu"
    # "radeon"
    # "nouveau"
    # "modesetting"
    "fbdev"
  ];
  
  # Make some extra kernel modules available to NixOS
  boot.extraModulePackages = with config.boot.kernelPackages;[ 
    v4l2loopback.out 
  ];
  # Activate kernel modules (choose from built-ins and extra ones)
  boot.kernelModules = [
    "v4l2loopback"
  ];
  # Set initial kernel module settings
  boot.extraModprobeConfig = ''
    options v4l2loopback exclusive_caps=1 card_label="Virtual Camera"
  '';
  
  # kernel
  #boot.kernelPackages = pkgs.linuxPackages_latest;

  #zram
  zramSwap.enable = true;
  zramSwap.memoryPercent = 400;
  
  # zramSwap.memoryMax = 34359738368;

 # services.getty.greetingLine = ''''; 
  
  #filesystem
  boot.supportedFilesystems = [
      "btrfs"
      "ntfs"
      "fat32"
      "exfat"      
  ];

  # samba
  #services = {
  #  samba = {
  #    enable = false;
  #    shares = {
  #      public = {
  #        path = "/home/smb/";
  #        comment = "Shared Directory";
  #        read_only = false;
  #        guest_ok = true;
  #        browseable = true;
  #      };
  #    };
  #  };
  #};


  # flatpak
  #services.flatpak.enable = false;

  # waydroid
  # virtualisation = {
    # waydroid.enable = true;
    # lxd.enable = true;
  # };
   
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "id_ID.UTF-8";
    LC_IDENTIFICATION = "id_ID.UTF-8";
    LC_MEASUREMENT = "id_ID.UTF-8";
    LC_MONETARY = "id_ID.UTF-8";
    LC_NAME = "id_ID.UTF-8";
    LC_NUMERIC = "id_ID.UTF-8";
    LC_PAPER = "id_ID.UTF-8";
    LC_TELEPHONE = "id_ID.UTF-8";
    LC_TIME = "id_ID.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # hyprland
  programs.hyprland.enable = false;

  # swaywm
  #programs.sway.enable = false;
  #programs.sway.extraPackages = with pkgs; [
  #  waybar rofi slurp grim wf-recorder
  #  fuzzel
 #];
  hardware.opengl.enable = true;
  environment.variables = {
    "WLR_NO_HARDWARE_CURSORS" = "1";
    "WLR_RENDERER" = "pixman";
    "WLR_RENDERER_ALLOW_SOFTWARE" = "1";
    "NIXPKGS_ALLOW_UNFREE" = "1";
  };

  # Desktop Environment.
   #services.xserver.displayManager.lightdm.enable = true;
   services.xserver.displayManager.startx.enable = true;
    
   services.xserver.desktopManager.lxqt.enable = true;
  # services.xserver.desktopManager.budgie.enable = true;
  # services.xserver.desktopManager.deepin.enable = true;
  # services.xserver.desktopManager.xfce.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;
  # services.xserver.desktopManager.pantheon.enable = true;
  # services.xserver.desktopManager.mate.enable = true;
  # services.xserver.desktopManager.cinnamon.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;
  # services.xserver.desktopManager.enlightenment.enable = true;
  
  # exclude
  environment.plasma5.excludePackages = with pkgs; [
    libsForQt5.elisa
    libsForQt5.gwenview
    libsForQt5.konsole
    libsForQt5.okular
    libsForQt5.spectacle    
    libsForQt5.ark
    orca
  ];
  
  #services.gnome.evolution-data-server.enable = pkgs.lib.mkForce false;
  #services.gnome.gnome-online-accounts.enable = pkgs.lib.mkForce false;
  #programs.gnome-terminal.enable = pkgs.lib.mkForce false;
  environment.gnome.excludePackages = with pkgs; [
    gnome.gnome-terminal
    gnome.gnome-system-monitor
    gnome.gnome-screenshot
    gnome.gnome-music
    gnome.gnome-keyring
    gnome.file-roller
    gnome.eog
    gnome.yelp
    gnome.totem
    gnome.gedit
    gnome.geary
    gnome.cheese
    orca
    epiphany
    gnome-text-editor
    # gnome.nautilus
    gnome.gnome-contacts
    gnome.gnome-weather
    gnome.simple-scan
    gnome-photos
    evince
    gnome.gnome-disk-utility    
    gnome-tour
  ];
  
  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;    
    jack.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ramuni = {
    isNormalUser = true;
    description = "Ramuni muni";
    extraGroups = [ "networkmanager" "wheel" "video"];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # editable nix store
  # boot.readOnlyNixStore = false;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [       
    #gimp
    #inkscape-with-extensions
    chromium 
    #libreoffice-qt
    #krdc
    #krfb
    #pdfarranger
    gparted    
    #simplescreenrecorder
    #vlc
    xorg.xhost pulseaudio wget onboard ffmpeg_5-full
    xfce.mousepad
    lxde.lxtask htop btop neofetch    
    gzip        
  ] ++ (
    if (config.services.xserver.desktopManager.plasma5.enable == true)
    then with pkgs; [
      libsForQt5.applet-window-buttons
      libsForQt5.kde2-decoration
      lxqt.screengrab
      lxqt.pavucontrol-qt
      lxqt.qterminal
      lxqt.pcmanfm-qt
      lxmenu-data
      menu-cache    
      lxqt.lximage-qt
      lxqt.lxqt-archiver
      lxqt.lxqt-sudo
      libsForQt5.breeze-icons
    ] else
    if (config.services.xserver.desktopManager.lxqt.enable == true)
    then with pkgs; [
      libsForQt5.kwin
      libsForQt5.systemsettings
      libsForQt5.kglobalaccel
      libsForQt5.qt5.qttools    
      networkmanagerapplet       
    ] else with pkgs; [
      lxqt.screengrab
      lxqt.pavucontrol-qt
      lxqt.qterminal
      lxqt.pcmanfm-qt
      lxmenu-data
      menu-cache    
      lxqt.lximage-qt
      lxqt.lxqt-archiver
      lxqt.lxqt-sudo
      libsForQt5.breeze-icons
    ]
  );
    
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
  
  # ftp
  #services.vsftpd.enable = false;
  #services.vsftpd.writeEnable =true;
  #services.vsftpd.localUsers = true;
  
  #services.vsftpd.anonymousUser = true;
  #services.vsftpd.anonymousUserHome = "/home/ftp/";
  #services.vsftpd.anonymousUserNoPassword = true;
  #services.vsftpd.anonymousUploadEnable = true;
  

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ 5900 21 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  
  # webserver
  #services.httpd.enable = false;
  #services.httpd.virtualHosts.localhost.documentRoot = "/ramuni/Public/";
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
