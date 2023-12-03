{ pkgs, ... }: 

{
  home.stateVersion = "23.11"; 
  home.username = "ramuni";
  home.packages = with pkgs; [];  
  programs.home-manager.enable = true; 

  # openbox rc.xml
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
      <underMouse>no</underMouse>
      <focusDelay>200</focusDelay>
      <raiseOnFocus>no</raiseOnFocus>
    </focus>
  
    <placement>
      <policy>Smart</policy>
      <center>yes</center>
      <monitor>Primary</monitor>
      <primaryMonitor>1</primaryMonitor>
    </placement>

    <theme>
      <name>Bear2</name>
      <titleLayout>NLIMC</titleLayout>
      <keepBorder>yes</keepBorder>
      <animateIconify>no</animateIconify>
      <font place="ActiveWindow">
        <name>Sans Serif</name>
        <size>10</size>
        <weight>Normal</weight>
        <slant>Normal</slant>
      </font>
      <font place="InactiveWindow">
        <name>Sans Serif</name>
        <size>10</size>
        <weight>Normal</weight>
        <slant>Normal</slant>
      </font>
      <font place="MenuHeader">
        <name>sans</name>
        <size>9</size>
        <weight>normal</weight>
        <slant>normal</slant>
      </font>
      <font place="MenuItem">
        <name>sans</name>
        <size>9</size>
        <weight>normal</weight>
        <slant>normal</slant>
      </font>
      <font place="ActiveOnScreenDisplay">
        <name>sans</name>
        <size>9</size>
        <weight>bold</weight>
        <slant>normal</slant>
      </font>
      <font place="InactiveOnScreenDisplay">
        <name>sans</name>
        <size>9</size>
        <weight>bold</weight>
        <slant>normal</slant>
      </font>
    </theme>
  
    <desktops>
      <number>4</number>
      <firstdesk>1</firstdesk>
      <names>
      </names>
      <popupTime>2</popupTime>
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
      <position>TopRight</position>
      <floatingX>0</floatingX>
      <floatingY>0</floatingY>
      <noStrut>no</noStrut>
      <stacking>Above</stacking>
      <direction>Vertical</direction>
      <autoHide>no</autoHide>
      <hideDelay>300</hideDelay>
      <showDelay>300</showDelay>
      <moveButton>Middle</moveButton>
    </dock>
  
    <keyboard>
      <chainQuitKey>C-g</chainQuitKey>
  
      <!-- maximize and restore -->    
      <keybind key="W-Prior">
        <action name="Maximize"/>
        <action name="Undecorate"/>
      </keybind>
      <keybind key="W-Next">
        <action name="Unmaximize"/>
        <action name="Decorate"/>
      </keybind>
  
      <!-- change desktop -->
      <keybind key="W-1">
        <action name="GoToDesktop">
          <to>1</to>
        </action>
      </keybind>
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
  
      <!-- move app to desktop -->
      <keybind key="W-A-Left">
        <action name="SendToDesktop">
          <to>left</to>
          <wrap>no</wrap>
        </action>
      </keybind>
      <keybind key="W-A-Right">
        <action name="SendToDesktop">
          <to>right</to>
          <wrap>no</wrap>
        </action>
      </keybind>
      <keybind key="W-A-Up">
        <action name="SendToDesktop">
          <to>up</to>
          <wrap>no</wrap>
        </action>
      </keybind>
      <keybind key="W-A-Down">
        <action name="SendToDesktop">
          <to>down</to>
          <wrap>no</wrap>
        </action>
      </keybind>
  
      <!-- show desktop -->    
      <keybind key="W-d">
        <action name="ToggleShowDesktop"/>
      </keybind>
  
      <!-- Keybindings for windows -->
      <keybind key="W-c">
        <action name="Close"/>
      </keybind>
      <keybind key="W-End">
        <action name="Close"/>
      </keybind>
      <keybind key="A-Escape">
        <action name="Lower"/>
        <action name="FocusToBottom"/>
        <action name="Unfocus"/>
      </keybind>
  
      <!-- show client menu -->
      <keybind key="A-Space">
        <action name="ShowMenu">
          <menu>client-menu</menu>
        </action>
      </keybind>
  
      <!-- change window -->
      <keybind key="W-Tab">
        <action name="NextWindow">
          <finalactions>
            <action name="Focus"/>
            <action name="Raise"/>
            <action name="Unshade"/>
          </finalactions>
        </action>
      </keybind>
      <keybind key="A-Tab">
        <action name="PreviousWindow">
          <finalactions>
            <action name="Focus"/>
            <action name="Raise"/>
            <action name="Unshade"/>
          </finalactions>
        </action>
      </keybind>
          
      <!-- pseudo tiles -->
      <keybind key="W-Left">
        <action name="Unmaximize"/>
        <action name="Undecorate"/>
        <action name="MoveResizeTo">
          <x>0</x>
          <y>0</y>
          <width>50%</width>
          <height>100%</height>
        </action>
      </keybind>
      <keybind key="W-Right">
        <action name="Unmaximize"/>
        <action name="Undecorate"/>
        <action name="MoveResizeTo">
          <x>-0</x>
          <y>0</y>
          <width>50%</width>
          <height>100%</height>
        </action>
      </keybind>
      <keybind key="W-Up">
        <action name="Unmaximize"/>
        <action name="Undecorate"/>
        <action name="MoveResizeTo">
          <x>0</x>
          <y>0</y>
          <width>100%</width>
          <height>50%</height>
        </action>
      </keybind>
      <keybind key="W-Down">
        <action name="Unmaximize"/>
        <action name="Undecorate"/>
        <action name="MoveResizeTo">
          <x>0</x>
          <y>-0</y>
          <width>100%</width>
          <height>50%</height>
        </action>
      </keybind>
  
      <!-- running applications -->
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
      <keybind key="W-g">
        <action name="Execute">
          <command>google-chrome-stable</command>
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
        <mousebind button="W-A-Up" action="Click">
          <action name="GoToDesktop">
            <to>previous</to>
          </action>
        </mousebind>
        <mousebind button="W-A-Down" action="Click">
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
        <mousebind button="Middle" action="Press">
          <action name="ShowMenu">
            <menu>client-list-combined-menu</menu>
          </action>
        </mousebind>
        <!-- <mousebind button="Right" action="Press">
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
    </menu>
  
    <applications>
      <application type="normal">
        <maximized>true</maximized>
        <decor>no</decor>
      </application>
    </applications>
    
    </openbox_config>
  
  '';    
  
  
}
     

