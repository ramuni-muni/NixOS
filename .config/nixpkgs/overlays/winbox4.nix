self: super: {
  winbox4 = super.stdenv.mkDerivation rec {
    pname = "winbox4";
    version = "4.0beta3";

    src = super.fetchurl {
      url = "https://download.mikrotik.com/routeros/winbox/4.0beta3/WinBox_Linux.zip";
      sha256 = "sha256-GBxM6NKE05x1DZQKegJY7c5awvSenfWVgrr4Kj9esZg="; # Update with the correct checksum
    };

    nativeBuildInputs = with super; [ 
      unzip 
      autoPatchelfHook
    ];

    buildInputs = with super; [     
      libglvnd
      zlib
      freetype
      fontconfig
      libxkbcommon
      xorg.libxcb
      xorg.xcbutilwm
      xorg.xcbutilimage
      xorg.xcbutilkeysyms
      xorg.xcbutilrenderutil
    ];

    installPhase = ''
      mkdir -p $out/bin
      unzip $src -d $out/bin
      chmod +x $out/bin/WinBox

      # Generate .desktop file
      mkdir -p $out/share/applications
      touch $out/share/applications/winbox4.desktop
    cat << EOF > $out/share/applications/winbox4.desktop
[Desktop Entry]
Name=WinBox4
Comment=WinBox for Linux
Exec=$out/bin/WinBox
Icon=$out/bin/assets/img/winbox.png
Terminal=false
Type=Application
Categories=Network;Utility;
EOF
    '';
    
  };
}
