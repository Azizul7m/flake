{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  pname = "tree-sitter-nix";
  version = "main";
  src = pkgs.fetchFromGitHub {
    owner = "cstrahan";
    repo = "tree-sitter-nix";
    rev = "main";
    sha256 = "1111111111111111111111111111111111111111111111111111";
  };
  nativeBuildInputs = [ pkgs.tree-sitter ];
  buildPhase = ''
    tree-sitter generate
    gcc -shared -o libtree-sitter-nix.so -fPIC src/parser.c src/scanner.c
  '';
  installPhase = ''
    mkdir -p $out/lib
    cp libtree-sitter-nix.so $out/lib/
  '';
  meta = with pkgs.lib; {
    description = "Tree-sitter grammar for Nix";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
