self: super: 
{
	inkscape = super.inkscape.overrideAttrs (prev: rec{
		version = "1.3";
		src = super.fetchurl {	
       			url = "https://media.inkscape.org/dl/resources/file/inkscape-${version}.tar.xz";
        		sha256 = "sha256-v08oawJeAWm4lIzBTVGZqbTCBNdhyJTEtISWVx7HYwc=";
		};
		buildInputs = prev.buildInputs ++ [ super.double-conversion super.libepoxy ];
	});    	
}