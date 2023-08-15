self: super: 
{
	google-chrome = super.google-chrome.override (prev: rec{
		speechd = "";
	});    	
}
