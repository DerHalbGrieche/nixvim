{pkgs, ...}: let
  ariaMathMp3 = pkgs.fetchurl {
    url = "https://dn710207.ca.archive.org/0/items/minecraftvolumebeta/13.%20Aria%20Math.mp3";
    sha256 = "sha256-3TzcN0YYBL8cIUqM5KJ3ASWEdXHtqybic3/fsawDELg=";
  };
in {
  extraPackages = with pkgs; [
    mpv
    killall
  ];
  autoCmd = [
    {
      event = "VimEnter";
      pattern = "*";
      command = "silent !nohup mpv --loop --volume=120 \"${ariaMathMp3}\" >/dev/null 2>&1 &";
    }
    {
      event = "VimLeave";
      pattern = "*";
      command = "!killall mpv";
    }
  ];
}
