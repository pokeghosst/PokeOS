{ config, pkgs, lib, ... }:

let nixFiles = builtins.filter
    (name: name != "default.nix" &&  lib.hasSuffix ".nix" name)
    (builtins.attrNames (builtins.readDir ./.));
in
{
    imports = map (file: ./. + "/${file}") nixFiles;
}
