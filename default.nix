{ pkgs ? import <nixpkgs> { } }:
pkgs.callPackage (builtins.getFlake (toString ./.)).outputs.package { }
