self: super: 
{
  google-chrome = (super.google-chrome.override (prev: rec{
    speechd = "";		
  })).overrideAttrs (oldAttrs: rec{
    name = "google-chrome";		
    src = super.fetchurl {	
      url = "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb";
      sha256 = "sha256-WLTTFMUvtBHvvegDFpZ+7Eht9StMyleaqXEBhPhgPTs=";
    };
  });    		
}