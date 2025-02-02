{ pkgs
, ...
}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    # TODO: Setup possible configs here
    extensions = with pkgs.vscode-extensions; [ ];
  };
}
