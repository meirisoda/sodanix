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
      # LaurentTreguier.simple-icons
      yzane.markdown-pdf
      aaron-bond.better-comments
      ziyasal.vscode-open-in-github
      bbenoist.nix
    ];
  }) 
];
}