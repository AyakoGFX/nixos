#DWM doing others wasy
xpkgs.overlays = [
(final: prev: {
  dwm = prev.dwm.overrideAttrs (old: { src = /home/ayako/dwm2 ;});
  slstatus = prev.openrgb.overrideAttrs (old: { src = /home/ayako/dwm2/slstatus ;});
})


# other ways to do the name thing above
  environment.systemPackages = [ (slstatus.overrideAttrs (_: { src = /home/ayako/dwm2/slstatus; })) ];
  nixpkgs.overlays = [(final: prev: { slstatus = final.slstatus.overrideAttrs (_: { src = /home/ayako/dwm2/slstatus; }); })];

#one that worked for me is
environment.systemPackages = with pkgs; [
(slstatus.overrideAttrs (_: { src =/home/ayako/dwm2/slstatus ; }))
firefox
];
