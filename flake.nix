{
  description = "Setup shell needed to run nodejs project";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... } @ inputs: 
  flake-utils.lib.eachDefaultSystem(system:
    let 
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          nodejs 
        ];
      };
    }
  );
}
