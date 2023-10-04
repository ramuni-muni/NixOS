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
  boot.loader.grub.device = "/dev/disk/by-id/ata-MidasForce_SSD_120GB_AA000000000000003126"; 
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.theme = pkgs.nixos-grub2-theme;
  boot.loader.grub.extraEntries = ''  

  menuentry "Nixos livecd" --class installer {
    set isofile="/nixos.iso"      
    loopback loop (hd0,2)$isofile 
    #configfile (loop)/EFI/grub/grub.cfg
    linux (loop)/boot/bzImage findiso=/$isofile init=/nix/store/0x1xgnlgs3p73khg3m45g1n7qmh46pmz-nixos-system-nixos-23.05.3759.261abe8a44a7/init root=LABEL=nixos-23.05-x86_64 boot.shell_on_fail nohibernate loglevel=4 
    initrd (loop)/boot/initrd
  }

  menuentry "Slax (Persistent changes) from ISO" {
    loopback loop (hd0,2)/slax.iso
    linux (loop)/slax/boot/vmlinuz vga=normal load_ramdisk=1 prompt_ramdisk=0 rw printk.time=0 consoleblank=0 slax.flags=perch,automount fromiso=/slax.iso
    initrd (loop)/slax/boot/initrfs.img
  }
  
  '';

  #boot.plymouth.enable = true;
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # nvidia driver
  services.xserver.videoDrivers = [ "fbdev" ];
  #nixpkgs.config.nvidia.acceptLicense = true;   
  #hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_390;
  #hardware.nvidia.modesetting.enable = true;

  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # kernel
  #boot.kernelPackages = pkgs.linuxPackages_latest;
  
  # virtual camera
  # Make some extra kernel modules available to NixOS
  boot.extraModulePackages = with config.boot.kernelPackages;[ v4l2loopback.out ];  
  boot.kernelModules = [ "v4l2loopback" ];  
  boot.extraModprobeConfig = '' options v4l2loopback exclusive_caps=1 card_label="Virtual Camera" '';
  
  #zram
  zramSwap.enable = true;
  zramSwap.memoryPercent = 300;
  # zramSwap.memoryMax = 34359738368;
  
  #filesystem
  boot.supportedFilesystems = [
      "btrfs"
      "ntfs"
      "fat32"
      "exfat"
  ];

  # waydroid
   virtualisation = {
     waydroid.enable = true;
     #lxd.enable = true;
     #lxc.enable = true;
   };
  virtualisation.lxc.defaultConfig = ''
    lxc.net.0.type = veth
    lxc.net.0.link = lxdbr0
    lxc.net.0.flags = up
  '';

   
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.hostName = "NixOS"; # Define your hostname.
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

  # Enable the X11 display server.
  services.xserver.enable = true;

  # swaywm
  #programs.sway.enable = false;
  #programs.hyprland.enable = true;
  #programs.sway.extraPackages = with pkgs; [
   # waybar rofi slurp grim wf-recorder
   # fuzzel foot
  #];

  # ENV
  environment.variables = {
    "WLR_NO_HARDWARE_CURSORS" = "1";
    "WLR_RENDERER" = "pixman";
    "WLR_RENDERER_ALLOW_SOFTWARE" = "1";
  };

  # Login Manager.
  services.xserver.displayManager.lightdm.enable = true;
  
  # Desktop Environtmen
  services.xserver.desktopManager.lxqt.enable = true;
  #services.xserver.desktopManager.budgie.enable = true;
  #services.xserver.desktopManager.deepin.enable = true;
  #services.xserver.desktopManager.xfce.enable = true;
  #services.xserver.desktopManager.plasma5.enable = true;
  #services.xserver.desktopManager.pantheon.enable = true;
  #services.xserver.desktopManager.mate.enable = true;
  #services.xserver.desktopManager.cinnamon.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;
  #services.xserver.desktopManager.enlightenment.enable = true;
  
  # plasma5 exclude
  environment.plasma5.excludePackages = with pkgs; [
    libsForQt5.elisa
    libsForQt5.gwenview
    libsForQt5.konsole
    libsForQt5.okular
    libsForQt5.spectacle    
    libsForQt5.ark
    orca
  ];

  # gnome exclude
  services.gnome.evolution-data-server.enable = pkgs.lib.mkForce false;
  services.gnome.gnome-online-accounts.enable = pkgs.lib.mkForce false;
  programs.gnome-terminal.enable = pkgs.lib.mkForce false;
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
    gnome.nautilus
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
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
  
  # editable nix store
  #boot.readOnlyNixStore = false;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [       
    gimp
    inkscape-with-extensions
    chromium 
    libreoffice-qt jre
    krdc
    krfb
    pdfarranger
    gparted    
    simplescreenrecorder
    vlc
    xorg.xhost pulseaudio wget onboard ffmpeg_5-full
    xfce.mousepad
    lxde.lxtask htop btop neofetch    
    p7zip       
  ] ++ (
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

  #virtualbox
  #virtualisation.virtualbox.host.enable = true;
  #virtualisation.virtualbox.guest.enable = true;
    
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
  # networking.firewall.allowedTCPPorts = [ 5900 21 22 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  
  # webserver
  #services.httpd.enable = true;
  #services.httpd.virtualHosts.localhost.documentRoot = "/home/ramuni/Public/";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
