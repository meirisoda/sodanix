{ config, pkgs, stablepkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  (vscode-with-extensions.override {
    vscodeExtensions = with vscode-extensions; [
      mhutchie.git-graph
      donjayamanne.githistory
      eamodio.gitlens
      ritwickdey.liveserver
      jnoortheen.nix-ide
      shaneliesegang.vscode-simple-icons-rev
      aaron-bond.better-comments
      bbenoist.nix
    ];
  }) 
];
}