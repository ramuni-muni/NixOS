# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      (import "${home-manager}/nixos")
    ];
    
  # my dot file  
  home-manager.users.ramuni = {    
    home.file.".config/openbox/rc.xml".text = ''
<?xml version="1.0" encoding="UTF-8"?>
<openbox_config xmlns="http://openbox.org/3.4/rc" xmlns:xi="http://www.w3.org/2001/XInclude">
  
  <resistance>
    <strength>10</strength>
    <screen_edge_strength>20</screen_edge_strength>
  </resistance>
  
  <focus>
    <focusNew>yes</focusNew>    
    <followMouse>no</followMouse>
    <focusLast>yes</focusLast>
    <underMouse>yes</underMouse>
    <focusDelay>200</focusDelay>
    <raiseOnFocus>yes</raiseOnFocus>
  </focus>
  
  <placement>
    <policy>Smart</policy>
    <center>yes</center>
    <monitor>Mouse</monitor>
    <primaryMonitor>1</primaryMonitor>
  </placement>
  
  <theme>
    <name>Bear2</name>
    <titleLayout>NLIMC</titleLayout>
    <keepBorder>yes</keepBorder>
    <animateIconify>yes</animateIconify>
    <font place="ActiveWindow">
      <name>sans</name>
      <size>10</size>
      <weight>Bold</weight>
      <slant>Normal</slant>
    </font>
    <font place="InactiveWindow">
      <name>sans</name>
      <size>10</size>
      <weight>Bold</weight>
      <slant>Normal</slant>
    </font>
    <font place="MenuHeader">
      <name>sans</name>
      <size>10</size>
      <weight>Normal</weight>
      <slant>Normal</slant>
    </font>
    <font place="MenuItem">
      <name>sans</name>
      <size>10</size>
      <weight>Normal</weight>
      <slant>Normal</slant>
    </font>
    <font place="ActiveOnScreenDisplay">
      <name>sans</name>
      <size>10</size>
      <weight>Bold</weight>
      <slant>Normal</slant>
    </font>
    <font place="InactiveOnScreenDisplay">
      <name>sans</name>
      <size>10</size>
      <weight>Bold</weight>
      <slant>Normal</slant>
    </font>
  </theme>
  
  <desktops>
    <number>10</number>
    <firstdesk>1</firstdesk>
    <names>
      <name>1</name>
      <name>2</name>
      <name>3</name>
      <name>4</name>
      <name>5</name>
      <name>6</name>
      <name>7</name>
      <name>8</name>
      <name>9</name>
      <name>10</name>
    </names>
    <popupTime>0</popupTime>
  </desktops>
  
  <resize>
    <drawContents>yes</drawContents>
    <popupShow>Nonpixel</popupShow>
    <popupPosition>Center</popupPosition>
    <popupFixedPosition>
      <x>10</x>
      <y>10</y>
    </popupFixedPosition>
  </resize>
  
  <margins>
    <top>0</top>
    <bottom>0</bottom>
    <left>0</left>
    <right>0</right>
  </margins>
  
  <dock>
    <position>BottomLeftFloating</position>
    <floatingX>0</floatingX>
    <floatingY>0</floatingY>
    <noStrut>no</noStrut>
    <stacking>Above</stacking>
    <direction>Horizontal</direction>
    <autoHide>yes</autoHide>
    <hideDelay>300</hideDelay>
    <showDelay>300</showDelay>
    <moveButton>Middle</moveButton>
  </dock>
  
  <keyboard>
    
    <chainQuitKey>C-g</chainQuitKey>
    <!-- Go to desktop -->
    <keybind key="W-C-Left">
      <action name="GoToDesktop">
        <to>left</to>
        <wrap>no</wrap>
      </action>
    </keybind>
    <keybind key="W-C-Right">
      <action name="GoToDesktop">
        <to>right</to>
        <wrap>no</wrap>
      </action>
    </keybind>
    <keybind key="W-C-Up">
      <action name="GoToDesktop">
        <to>up</to>
        <wrap>no</wrap>
      </action>
    </keybind>
    <keybind key="W-C-Down">
      <action name="GoToDesktop">
        <to>down</to>
        <wrap>no</wrap>
      </action>
    </keybind>
    
    <!-- send app to desktop-->
    <keybind key="A-W-Left">
      <action name="SendToDesktop">
        <to>left</to>
        <wrap>no</wrap>
      </action>
    </keybind>
    <keybind key="A-W-Right">
      <action name="SendToDesktop">
        <to>right</to>
        <wrap>no</wrap>
      </action>
    </keybind>
    <keybind key="A-W-Up">
      <action name="SendToDesktop">
        <to>up</to>
        <wrap>no</wrap>
      </action>
    </keybind>
    <keybind key="A-W-Down">
      <action name="SendToDesktop">
        <to>down</to>
        <wrap>no</wrap>
      </action>
    </keybind>
    <keybind key="W-1">
      <action name="GoToDesktop">
        <to>1</to>
      </action>
    </keybind>
    <keybind key="W-2">
      <action name="GoToDesktop">
        <to>2</to>
      </action>
    </keybind>
    <keybind key="W-3">
      <action name="GoToDesktop">
        <to>3</to>
      </action>
    </keybind>
    <keybind key="W-4">
      <action name="GoToDesktop">
        <to>4</to>
      </action>
    </keybind>
    
    <!-- show desktop/minimize all -->
    <keybind key="W-d">
      <action name="ToggleShowDesktop"/>
    </keybind>
    
    <!-- Keybindings for windows -->
    <keybind key="W-c">
      <action name="Close"/>
    </keybind>
    <keybind key="A-Escape">
      <action name="Lower"/>
      <action name="FocusToBottom"/>
      <action name="Unfocus"/>
    </keybind>
    <keybind key="A-space">
      <action name="ShowMenu">
        <menu>client-menu</menu>
      </action>
    </keybind>
    
    <!-- Keybindings for window switching -->
    <keybind key="A-Tab">
      <action name="NextWindow">
        <finalactions>
          <action name="Focus"/>
          <action name="Raise"/>
          <action name="Unshade"/>
        </finalactions>
      </action>
    </keybind>
    <keybind key="W-Tab">
      <action name="PreviousWindow">
        <finalactions>
          <action name="Focus"/>
          <action name="Raise"/>
          <action name="Unshade"/>
        </finalactions>
      </action>
    </keybind>
    <keybind key="C-A-Tab">
      <action name="NextWindow">
        <panels>yes</panels>
        <desktop>yes</desktop>
        <finalactions>
          <action name="Focus"/>
          <action name="Raise"/>
          <action name="Unshade"/>
        </finalactions>
      </action>
    </keybind>
    
    <!-- move focus to another window -->
    <keybind key="W-S-Right">
      <action name="DirectionalCycleWindows">
        <direction>right</direction>
      </action>
    </keybind>
    <keybind key="W-S-Left">
      <action name="DirectionalCycleWindows">
        <direction>left</direction>
      </action>
    </keybind>
    <keybind key="W-S-Up">
      <action name="DirectionalCycleWindows">
        <direction>up</direction>
      </action>
    </keybind>
    <keybind key="W-S-Down">
      <action name="DirectionalCycleWindows">
        <direction>down</direction>
      </action>
    </keybind>
    
    <!-- show menu/printscreen/terminal/filemanager -->
    <keybind key="W-Return">
      <action name="Execute">
        <command>rofi -show drun</command>
      </action>
    </keybind>
    <keybind key="Print">
      <action name="Execute">
        <command>screengrab</command>
      </action>
    </keybind>
    <keybind key="W-t">
      <action name="Execute">
        <command>qterminal</command>
      </action>
    </keybind>
    <keybind key="W-p">
      <action name="Execute">
        <command>pcmanfm-qt</command>
      </action>
    </keybind>
    <keybind key="W-m">
      <action name="Execute">
        <command>mousepad</command>
      </action>
    </keybind>
    <keybind key="W-z">
      <action name="ToggleMaximize"/>      
    </keybind>
    <keybind key="W-q">
      <action name="Execute">
        <command>openbox --exit</command>
      </action>
    </keybind>
    
    <!-- Keybindings for tiling/split -->
    <keybind key="W-Left">
      <action name="Unmaximize"/>
      <action name="MoveResizeTo">        
        <x>0</x>
        <y>0</y>
        <width>50%</width>
        <height>100%</height>
      </action>
    </keybind>
    <keybind key="W-Right">
      <action name="Unmaximize"/>
      <action name="MoveResizeTo">
        <x>-0</x>
        <y>0</y>
        <width>50%</width>
        <height>100%</height>
      </action>
    </keybind>
    <keybind key="W-Up">
      <action name="Unmaximize"/>
      <action name="MoveResizeTo">
        <x>0</x>
        <y>0</y>
        <width>100%</width>
        <height>50%</height>
      </action>
    </keybind>
    <keybind key="W-Down">
      <action name="Unmaximize"/>
      <action name="MoveResizeTo">
        <x>0</x>
        <y>-0</y>
        <width>100%</width>
        <height>50%</height>
      </action>
    </keybind>
    <keybind key="W-Prior">
      <action name="Unmaximize"/>
      <action name="MoveResizeTo">
        <x>-0</x>
        <y>0</y>
        <width>50%</width>
        <height>50%</height>
      </action>
    </keybind>
    <keybind key="W-Next">
      <action name="Unmaximize"/>
      <action name="MoveResizeTo">
        <x>-0</x>
        <y>-0</y>
        <width>50%</width>
        <height>50%</height>
      </action>
    </keybind>    
    <keybind key="W-Home">
      <action name="Unmaximize"/>
      <action name="MoveResizeTo">
        <x>0</x>
        <y>0</y>
        <width>50%</width>
        <height>50%</height>
      </action>
    </keybind>
    <keybind key="W-End">
      <action name="Unmaximize"/>
      <action name="MoveResizeTo">
        <x>0</x>
        <y>-0</y>
        <width>50%</width>
        <height>50%</height>
      </action>
    </keybind>
    
  </keyboard>

  <mouse>
    <dragThreshold>1</dragThreshold>
    <doubleClickTime>500</doubleClickTime>
    <screenEdgeWarpTime>400</screenEdgeWarpTime>
    <screenEdgeWarpMouse>false</screenEdgeWarpMouse>
    
    <context name="Frame">
      <mousebind button="W-Left" action="Press">
        <action name="Focus"/>
        <action name="Raise"/>
      </mousebind>
      <mousebind button="W-Left" action="Click">
        <action name="Unshade"/>
      </mousebind>
      <mousebind button="W-Left" action="Drag">
        <action name="Move"/>
      </mousebind>
      <mousebind button="W-Right" action="Press">
        <action name="Focus"/>
        <action name="Raise"/>
        <action name="Unshade"/>
      </mousebind>
      <mousebind button="W-Right" action="Drag">
        <action name="Resize"/>
      </mousebind>
      <mousebind button="W-Middle" action="Press">
        <action name="Lower"/>
        <action name="FocusToBottom"/>
        <action name="Unfocus"/>
      </mousebind>
      <mousebind button="W-Up" action="Click">
        <action name="GoToDesktop">
          <to>previous</to>
        </action>
      </mousebind>
      <mousebind button="W-Down" action="Click">
        <action name="GoToDesktop">
          <to>next</to>
        </action>
      </mousebind>
      <mousebind button="C-A-Up" action="Click">
        <action name="GoToDesktop">
          <to>previous</to>
        </action>
      </mousebind>
      <mousebind button="C-A-Down" action="Click">
        <action name="GoToDesktop">
          <to>next</to>
        </action>
      </mousebind>
      <mousebind button="A-W-Up" action="Click">
        <action name="SendToDesktop">
          <to>previous</to>
        </action>
      </mousebind>
      <mousebind button="A-W-Down" action="Click">
        <action name="SendToDesktop">
          <to>next</to>
        </action>
      </mousebind>
    </context>
    
    <context name="Titlebar">
      <mousebind button="Left" action="Drag">
        <action name="Move"/>
      </mousebind>
      <mousebind button="Left" action="DoubleClick">
        <action name="ToggleMaximize"/>
      </mousebind>
      <mousebind button="Up" action="Click">
        <action name="if">
          <shaded>no</shaded>
          <then>
            <action name="Shade"/>
            <action name="FocusToBottom"/>
            <action name="Unfocus"/>
            <action name="Lower"/>
          </then>
        </action>
      </mousebind>
      <mousebind button="Down" action="Click">
        <action name="if">
          <shaded>yes</shaded>
          <then>
            <action name="Unshade"/>
            <action name="Raise"/>
          </then>
        </action>
      </mousebind>
    </context>
    
    <context name="Titlebar Top Right Bottom Left TLCorner TRCorner BRCorner BLCorner">
      <mousebind button="Left" action="Press">
        <action name="Focus"/>
        <action name="Raise"/>
        <action name="Unshade"/>
      </mousebind>
      <mousebind button="Middle" action="Press">
        <action name="Lower"/>
        <action name="FocusToBottom"/>
        <action name="Unfocus"/>
      </mousebind>
      <mousebind button="Right" action="Press">
        <action name="Focus"/>
        <action name="Raise"/>
        <action name="ShowMenu">
          <menu>client-menu</menu>
        </action>
      </mousebind>
    </context>
    
    <context name="Top">
      <mousebind button="Left" action="Drag">
        <action name="Resize">
          <edge>top</edge>
        </action>
      </mousebind>
    </context>
    
    <context name="Left">
      <mousebind button="Left" action="Drag">
        <action name="Resize">
          <edge>left</edge>
        </action>
      </mousebind>
    </context>
    
    <context name="Right">
      <mousebind button="Left" action="Drag">
        <action name="Resize">
          <edge>right</edge>
        </action>
      </mousebind>
    </context>
    
    <context name="Bottom">
      <mousebind button="Left" action="Drag">
        <action name="Resize">
          <edge>bottom</edge>
        </action>
      </mousebind>
      <mousebind button="Right" action="Press">
        <action name="Focus"/>
        <action name="Raise"/>
        <action name="ShowMenu">
          <menu>client-menu</menu>
        </action>
      </mousebind>
    </context>
    
    <context name="TRCorner BRCorner TLCorner BLCorner">
      <mousebind button="Left" action="Press">
        <action name="Focus"/>
        <action name="Raise"/>
        <action name="Unshade"/>
      </mousebind>
      <mousebind button="Left" action="Drag">
        <action name="Resize"/>
      </mousebind>
    </context>
    
    <context name="Client">
      <mousebind button="Left" action="Press">
        <action name="Focus"/>
        <action name="Raise"/>
      </mousebind>
      <mousebind button="Middle" action="Press">
        <action name="Focus"/>
        <action name="Raise"/>
      </mousebind>
      <mousebind button="Right" action="Press">
        <action name="Focus"/>
        <action name="Raise"/>
      </mousebind>
    </context>
    
    <context name="Icon">
      <mousebind button="Left" action="Press">
        <action name="Focus"/>
        <action name="Raise"/>
        <action name="Unshade"/>
        <action name="ShowMenu">
          <menu>client-menu</menu>
        </action>
      </mousebind>
      <mousebind button="Right" action="Press">
        <action name="Focus"/>
        <action name="Raise"/>
        <action name="ShowMenu">
          <menu>client-menu</menu>
        </action>
      </mousebind>
    </context>
    
    <context name="AllDesktops">
      <mousebind button="Left" action="Press">
        <action name="Focus"/>
        <action name="Raise"/>
        <action name="Unshade"/>
      </mousebind>
      <mousebind button="Left" action="Click">
        <action name="ToggleOmnipresent"/>
      </mousebind>
    </context>
    
    <context name="Shade">
      <mousebind button="Left" action="Press">
        <action name="Focus"/>
        <action name="Raise"/>
      </mousebind>
      <mousebind button="Left" action="Click">
        <action name="ToggleShade"/>
      </mousebind>
    </context>
    
    <context name="Iconify">
      <mousebind button="Left" action="Press">
        <action name="Focus"/>
        <action name="Raise"/>
      </mousebind>
      <mousebind button="Left" action="Click">
        <action name="Iconify"/>
      </mousebind>
    </context>
    
    <context name="Maximize">
      <mousebind button="Left" action="Press">
        <action name="Focus"/>
        <action name="Raise"/>
        <action name="Unshade"/>
      </mousebind>
      <mousebind button="Middle" action="Press">
        <action name="Focus"/>
        <action name="Raise"/>
        <action name="Unshade"/>
      </mousebind>
      <mousebind button="Right" action="Press">
        <action name="Focus"/>
        <action name="Raise"/>
        <action name="Unshade"/>
      </mousebind>
      <mousebind button="Left" action="Click">
        <action name="ToggleMaximize"/>
      </mousebind>
      <mousebind button="Middle" action="Click">
        <action name="ToggleMaximize">
          <direction>vertical</direction>
        </action>
      </mousebind>
      <mousebind button="Right" action="Click">
        <action name="ToggleMaximize">
          <direction>horizontal</direction>
        </action>
      </mousebind>
    </context>
    
    <context name="Close">
      <mousebind button="Left" action="Press">
        <action name="Focus"/>
        <action name="Raise"/>
        <action name="Unshade"/>
      </mousebind>
      <mousebind button="Left" action="Click">
        <action name="Close"/>
      </mousebind>
    </context>
    
    <context name="Desktop">
      <mousebind button="Up" action="Click">
        <action name="GoToDesktop">
          <to>previous</to>
        </action>
      </mousebind>
      <mousebind button="Down" action="Click">
        <action name="GoToDesktop">
          <to>next</to>
        </action>
      </mousebind>
      <mousebind button="W-Up" action="Click">
        <action name="GoToDesktop">
          <to>previous</to>
        </action>
      </mousebind>
      <mousebind button="W-Down" action="Click">
        <action name="GoToDesktop">
          <to>next</to>
        </action>
      </mousebind>
      <mousebind button="C-A-Up" action="Click">
        <action name="GoToDesktop">
          <to>previous</to>
        </action>
      </mousebind>
      <mousebind button="C-A-Down" action="Click">
        <action name="GoToDesktop">
          <to>next</to>
        </action>
      </mousebind>
      <mousebind button="Left" action="Press">
        <action name="Focus"/>
        <action name="Raise"/>
      </mousebind>
      <mousebind button="Right" action="Press">
        <action name="Focus"/>
        <action name="Raise"/>
      </mousebind>
    </context>
    
    <context name="Root">
      <!-- Menus -->
      <!-- <mousebind button="Middle" action="Press">
        <action name="ShowMenu">
          <menu>client-list-combined-menu</menu>
        </action>
      </mousebind>
      <mousebind button="Right" action="Press">
        <action name="ShowMenu">
          <menu>root-menu</menu>
        </action>
      </mousebind> -->
    </context>
    
    <context name="MoveResize">
      <mousebind button="Up" action="Click">
        <action name="GoToDesktop">
          <to>previous</to>
        </action>
      </mousebind>
      <mousebind button="Down" action="Click">
        <action name="GoToDesktop">
          <to>next</to>
        </action>
      </mousebind>
      <mousebind button="A-Up" action="Click">
        <action name="GoToDesktop">
          <to>previous</to>
        </action>
      </mousebind>
      <mousebind button="A-Down" action="Click">
        <action name="GoToDesktop">
          <to>next</to>
        </action>
      </mousebind>
    </context>
    
  </mouse>

  <menu>
    <file>menu.xml</file>
    <hideDelay>200</hideDelay>
    <middle>no</middle>
    <submenuShowDelay>100</submenuShowDelay>
    <submenuHideDelay>400</submenuHideDelay>
    <showIcons>yes</showIcons>
    <manageDesktops>yes</manageDesktops>
  </menu>  
  
  <applications>
    <application name="*">                             
      <maximized>true</maximized>
      <decor>yes</decor>      
    </application>
    
    <application title="Kalender">                             
      <position force="no">
        <x>-5</x>
        <y>5</y>
      </position>      
    </application>
    <application title="Logout">                             
      <position force="no">
        <x>center</x>
        <y>center</y>
      </position>   
      <decor>yes</decor>   
    </application>
    
  </applications>  
  
</openbox_config>

    '';
    
    home.file.".config/openbox/autostart".text = ''
      dunst &
      polybar top &
      volumeicon &
      udiskie -t -n -f pcmanfm-qt -m nested &
      nm-applet &
      clipit &
      pactl list modules | grep module-echo-cancel && pactl unload-module module-echo-cancel
      pactl list modules | grep -q module-echo-cancel || pactl load-module module-echo-cancel &
      feh --bg-fill /home/ramuni/background.png &
      xhost + local:0 &
      lxqt-policykit-agent &
      numlockx on &
    '';
    
    home.file.".config/polybar/config.ini".text = ''
[colors]
background = #bb282A2E
background-alt = #99373B41
foreground = #FFFFFF
primary = #F0C674
secondary = #8ABEB7
alert = #A54242
disabled = #707880

[bar/top]
width = 100%
height = 18pt
;radius = 10
bottom = 0
;border-left-size = 0.5%
;border-right-size = 0.5%
border-top-size = 1
border-bottom-size = 1
padding-left = 3
padding-right = 3
module-margin = 1

;dpi = 96
background = #bb282A2E
foreground = #FFFFFF
;fixed-center = true
border-color = #00000000
font-0 = monospace:size=11;1
font-1 = 3270 Nerd Font:style=Regular
font-2 = Font Awesome 6 Free Solid:style=Solid
line-size = 3pt
override-redirect = false
wm-restack = generic
modules-left = launcher xworkspaces
modules-right = ara us cal date exit
tray-position = center
tray-background = #77FFFFFF

[module/ara]
type = custom/text
content = "arab"
click-left = setxkbmap -layout ara
background = #bb282A2E

[module/us]
type = custom/text
content = "us"
click-left = setxkbmap -layout us
background = #bb282A2E

[module/cal]
type = custom/text
content = ""
click-left = zenity --calendar --title="Kalender" --text="" --day="$(date +%e)" --month="$(date +%m)" --year="$(date +%Y)"
background = #bb282A2E

[module/exit]
type = custom/text
content = ""
click-left = zenity --question --title="Logout" --text "Are you sure to logout?" && openbox --exit
background = #bb282A2E

[module/launcher]
type = custom/text
content = " NixOS "
click-left = rofi -show drun
click-right = pkill rofi
background = #bb282A2E
[module/xworkspaces]
type = internal/xworkspaces

label-active = %name%
label-active-background = #99373B41
label-active-underline= #F0C674
label-active-padding = 1

label-occupied = %name%
label-occupied-padding = 1

label-urgent = %name%
label-urgent-background = #A54242
label-urgent-padding = 1

label-empty = %name%
label-empty-foreground = #707880
label-empty-padding = 1

[module/xwindow]
type = internal/xwindow
label = %title:0:60:...%

[module/xkeyboard]
type = internal/xkeyboard
blacklist-0 = num lock

label-layout = %layout%
label-layout-foreground = #F0C674

label-indicator-padding = 2
label-indicator-margin = 1
label-indicator-foreground = #bb282A2E
label-indicator-background = #8ABEB7

[module/date]
type = internal/date
interval = 1

date = %a, %e %b %Y %H:%M
;date-alt = %d %m %Y %H:%M

label = %date%
#label-foreground = \$\{colors.primary\}

[settings]
screenchange-reload = true
pseudo-transparency = true

; vim:ft=dosini

    '';
    
    home.file.".config/rofi/config.rasi".text = ''
configuration {
    drun-display-format: "{name}";
    disable-history: true;
}
* {
    foreground:  white;
    backlight:   #ccffeedd;
    background-color:  transparent;
    dark: #1c1c1c;
    // Black
    black:       #000000;
    lightblack:  #554444;
    tlightblack:  #554444cc;
    //
    // Red
    red:         #cd5c5c;
    lightred:    #cc5533;
    //
    // Green
    green:       #86af80;
    lightgreen:  #88cc22;
    //
    // Yellow
    yellow:      #e8ae5b;
    lightyellow:     #ffa75d;
    //
    // Blue
    blue:      #6495ed;
    lightblue:     #87ceeb;
    //
    // Magenta
    magenta:      #deb887;
    lightmagenta:     #996600;
    //
    // Cyan
    cyan:      #b0c4de;
    tcyan:      #ccb0c4de;
    lightcyan:     #b0c4de;
    //
    // White
    white:      #bbaa99;
    lightwhite:     #ddccbb;
    //
    // Bold, Italic, Underline
    highlight:     underline bold #ffffff;

    transparent: rgba(0,0,0,0);
    font: "Source Code Pro 10";
}
   
window {
    height:   70%;
    width: 50%;
    location: north;
    anchor:   north;

    border-color: grey;
    text-color: white;
    
    border-radius: 5px;
    y-offset: 120px;
    x-offset: 10px;
    children: [ inputbar, message, listview ];

    transparency: "screenshot";
    padding: 10px;
    border:  1px;
    border-radius: 10px;
    color: white;
    background-color: rgba(0,0,0,0.75);
    spacing: 0;

}
scrollbar {
    width: 0px ;
    border: 0;
    handle-width: 0px ;
    padding: 0;
}

message {
    border-color: @foreground;
    border:  0px 2px 2px 2px;
//    border-radius: 10px;
    padding: 5;
    background-color: @tcyan;
}
message {
    font: "Source Code Pro 8";
    color: @black;
}
inputbar {
    color: grey;
    padding: 5px;
    background-color: rgba(0,0,0,0.5);
    border: 1px;
    border-radius:  5px;

    font: "Source Code Pro 10";
    children: [ icon-k, entry ];
}

    icon-k {
    expand: false;
    filename: "gohome";
    size: 24;
    vertical-align: 0.5;

}

entry,prompt,case-indicator {
    text-font: inherit;
    text-color:inherit;
    padding: 2px;
}
prompt {
    margin:     0px 0.3em 0em 0em ;
}
listview {
    padding: 3px;
    border-radius: 0px 0px 0px 0px;

    border: 0px;
    background-color: rgba(0,0,0,0);
    dynamic: false;
    reverse: false;
    cycle: false;
}
element {
    padding: 1px;
    vertical-align: 0.5;
//    border: 2px;
    border-radius: 1px;
    background-color: rgba(0,0,0,0);
    color: white;
    font: inherit;
    children: [ element-icon, element-text ];
}
element-text {
    background-color: inherit;
    text-color:       inherit;
}
element.selected.normal {
    background-color: @blue;
}
element.normal.active {
    foreground: @lightblue;
}
element.normal.urgent {
    foreground: @lightred;
}
element.alternate.normal {
    background-color: rgba(0,0,0,0);
}
element.normal.normal {
    background-color: rgba(0,0,0,0);
}

element.alternate.active {
    foreground: @lightblue;
}
element.alternate.urgent {
    foreground: @lightred;
}
element.selected.active {
    background-color: @lightblue;
    foreground: @dark;
}
element.selected.urgent {
    background-color: @lightred;
    foreground: @dark;
}
vertb {
    expand: false;
    children: [ dummy0, mode-switcher, dummy1  ];
}
dummy0,  dummy1 {
    expand: true;
}
mode-switcher {
    expand: false;
    orientation: vertical;
    spacing: 0px;
    border: 0px 0px 0px 0px;
}
button {
    font: "FontAwesome 22";
    padding: 6px;
    border: 2px 0px 2px 2px;
    border-radius: 4px 0px 0px 4px;
    background-color: @tlightblack;
    border-color: @foreground;
    color: @foreground;
    horizontal-align: 0.5;
}
button selected normal {
    color: @dark;
    border: 2px 0px 2px 2px;
    background-color: @backlight;
    border-color: @foreground;
}
error-message {
    expand: true;
    background-color: red;
    border-color: darkred;
    border: 2px;
    padding: 1em;
}    
    '';
    
    home.stateVersion = "23.05";    
  };
  
  # powerManagement.cpuFreqGovernor = "performance"; 
  # Often used values: “ondemand”, “powersave”, “performance”

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/disk/by-id/ata-MidasForce_SSD_120GB_AA000000000000003126"; # change with your storage device id
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
  #boot.loader.grub.extraEntriesBeforeNixOS = true;
  #boot.loader.grub.timeoutStyle = "hidden";
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
   #virtualisation = {
     #waydroid.enable = true;
     #lxd.enable = true;
     #lxc.enable = true;
   #};
  #virtualisation.lxc.defaultConfig = ''
   # lxc.net.0.type = veth
   # lxc.net.0.link = lxdbr0
   # lxc.net.0.flags = up
  #'';

   
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

  # Fonts  
  fonts.packages = with pkgs; [ nerdfonts ];

  # swaywm
    #programs.sway.enable = true;  
    #programs.sway.extraPackages = with pkgs; [
    #  waybar rofi slurp grim wf-recorder
    #  fuzzel foot
    #];

  # hypr
  services.xserver.windowManager.hypr.enable = true;
  services.picom.enable = if(config.services.xserver.windowManager.hypr.enable == true)then true else false;
  services.picom.fade = true;
  #services.picom.shadow = true;
  #services.picom.fadeExclude = [ 
  #  "window_type *= 'menu'"
  #];
  #services.picom.fadeSteps = [
  #  0.04
  #  0.04
  #];
  services.gvfs.enable = if(config.services.xserver.windowManager.hypr.enable == true)then true else false;
  
  # hyprland
    #programs.hyprland.enable = true;
    #programs.hyprland.enableNvidiaPatches = true;

  # openbox
  services.xserver.windowManager.openbox.enable = true;

  # ENV
  environment.variables = {
    "WLR_NO_HARDWARE_CURSORS" = "1";
    "WLR_RENDERER" = "pixman";
    "WLR_RENDERER_ALLOW_SOFTWARE" = "1";
    "LIBGL_ALWAYS_SOFTWARE" = "1";
  };

  # Login Manager.
  services.xserver.displayManager.lightdm.enable = true;
  
  # Desktop Environtmen
  #services.xserver.desktopManager.lxqt.enable = true;
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
    extraGroups = [ "networkmanager" "wheel" "video" ];
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
    kget
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
  ) ++ (
    if(config.services.xserver.desktopManager.plasma5.enable == true)
    then with pkgs;[
        libsForQt5.applet-window-buttons
    ] else with pkgs;[

    ]
  ) ++ (
    if(config.services.xserver.windowManager.openbox.enable == true)
    then with pkgs;[
      feh
      polybar
      rofi    
      networkmanagerapplet
      lxappearance
      apple-cursor
      udiskie
      lxqt.lxqt-policykit
      dunst
      libnotify
      volumeicon
      clipit
      gnome.zenity
      obconf
      numlockx
    ] else [

    ]
  );

  #virtualbox
  #virtualisation.virtualbox.host.enable = true;
  #virtualisation.virtualbox.guest.enable = true;
  #virtualisation.virtualbox.guest.x11 = true;
  #virtualisation.virtualbox.host.enableExtensionPack = true;
    
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
