{ config, pkgs, stablepkgs, ... }:

{
  enable = true;

  environment.systemPackages = with pkgs; [
  (vscode-with-extensions.override {
    vscodeExtensions = with vscode-extensions; [
      mhutchie.git-graph
      donjayamanne.git-history
      eamodio.gitlens
      ritwickdey.liveserver
      jnoortheen.nix-ide
      LaurentTreguier.simple-icons
      vscode_exts.yzane.markdown-pdf
      vscode_exts.aaron-bond.better-comments
      vscode_exts.ziyasal.vscode-open-in-github
      bbenoist.nix
      vscode_exts.tht13.html-preview-vscode
    ];
  }) 
];
}