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
        "editor.fontFamily" = "GeistMono Nerd Font";
        "editor.fontLigatures" = true;
        "editor.formatOnSave" = true;
        "editor.minimap.enabled" = false;
        "editor.cursorBlinking" = "expand";
        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.suggestSelection" = "first";
        "editor.acceptSuggestionOnCommitCharacter" = true;
        "editor.acceptSuggestionOnEnter" = "on";
        "editor.autoClosingBrackets" = "always";

        "workbench.colorTheme" = "Mana Lord's Moon Light Theme";
        "workbench.iconTheme" = "moxer-icons";
        "workbench.productIconTheme" = "fluent-icons";
        "terminal.integrated.fontSize" = 14;
        "terminal.integrated.fontFamily" = "Fira Code";
        "window.menuBarVisibility" = "toggle";
        "telemetry.telemetryLevel" = "off";

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
      extensions = with pkgs.vscode-marketplace; [
        manalord.mana-lord-theme
        equinusocio.moxer-icons
        miguelsolorio.fluent-icons
        golang.go
        jnoortheen.nix-ide
        github.copilot
        # ms-python.python
        # rust-lang.rust-analyzer
        # tamasfe.even-better-toml
        # serayuzgur.crates
        # vadimcn.vscode-lldb
      ];
    };
  };
}
