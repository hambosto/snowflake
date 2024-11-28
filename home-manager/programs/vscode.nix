{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.vscode;
in
{
  config = lib.mkIf cfg.enable {
    stylix.targets.vscode.enable = false;
    programs.vscode = {
      enable = true;
      userSettings = {
        "editor.fontSize" = 14;
        "editor.fontFamily" = "Fira Code";
        "editor.fontLigatures" = true;
        "editor.formatOnSave" = true;
        "editor.minimap.enabled" = false;
        "editor.cursorBlinking" = "expand";
        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.suggestSelection" = "first";
        "editor.acceptSuggestionOnCommitCharacter" = true;
        "editor.acceptSuggestionOnEnter" = "on";
        "editor.autoClosingBrackets" = "always";
        "workbench.colorTheme" = "Tokyo Night";
        "workbench.iconTheme" = "moxer-icons";
        "workbench.productIconTheme" = "fluent-icons";
        "terminal.integrated.fontSize" = 14;
        "terminal.integrated.fontFamily" = "Fira Code";
        "window.menuBarVisibility" = "toggle";

        "go.inlayHints.assignVariableTypes" = true;
        "go.inlayHints.constantValues" = true;
        "go.inlayHints.parameterNames" = true;
        "go.inlayHints.rangeVariableTypes" = true;
        "go.alternateTools" = {
          "gofumpt" = "${pkgs.gofumpt}/bin/gofumpt";
          "golangci-lint" = "${pkgs.golangci-lint}/bin/golangci-lint";
          "gomodifytags" = "${pkgs.gomodifytags}/bin/gomodifytags";
          "gopls" = "${pkgs.gopls}/bin/gopls";
          "impl" = "${pkgs.impl}/bin/impl";
          "staticcheck" = "${pkgs.go-tools}/bin/staticcheck";
          "delve" = "${pkgs.delve}/bin/dlv";
        };
        "go.lintTool" = "golangci-lint";
        "gopls" = {
          "formatting.gofumpt" = true;
          "ui.semanticTokens" = true;
        };

        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "${pkgs.nixd}/bin/nixd";
        "nix.serverSettings" = {
          "nixd" = {
            "formatting" = {
              "command" = [ "${pkgs.nixfmt-rfc-style}/bin/nixfmt" ];
            };
          };
        };
      };
      extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "tokyo-night";
          publisher = "enkia";
          version = "1.0.9";
          sha256 = "sha256-2EphqiRVFw5cHAfCS+wscUM5eR48W9y96LJZQH4k0l4=";
        }
        {
          name = "moxer-icons";
          publisher = "Equinusocio";
          version = "5.12.1";
          sha256 = "sha256-G63DUhg65Qv7LpKdZ4VFZCBtMIpFfoKjJs3b+2krEfM=";
        }
        {
          name = "fluent-icons";
          publisher = "miguelsolorio";
          version = "0.0.19";
          sha256 = "sha256-OfPSh0SapT+YOfi0cz3ep8hEhgCTHpjs1FfmgAyjN58=";
        }
        {
          name = "Go";
          publisher = "golang";
          version = "0.43.2";
          sha256 = "sha256-LFJLU4Vodo8rGgQ5waxlN70jr0TZUMlknmqfx259egE=";
        }
        {
          name = "nix-ide";
          publisher = "jnoortheen";
          version = "0.3.5";
          sha256 = "sha256-hiyFZVsZkxpc2Kh0zi3NGwA/FUbetAS9khWxYesxT4s=";
        }
      ];
    };
  };
}
