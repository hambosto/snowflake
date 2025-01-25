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
        "editor.fontFamily" = "ComicShannsMono Nerd Font";
        "editor.fontLigatures" = true;
        "editor.fontWeight" = "800";
        "editor.formatOnSave" = true;
        "editor.minimap.enabled" = false;
        "editor.cursorBlinking" = "expand";
        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.suggestSelection" = "first";
        "editor.acceptSuggestionOnCommitCharacter" = true;
        "editor.acceptSuggestionOnEnter" = "on";
        "editor.autoClosingBrackets" = "always";

        "workbench.colorTheme" = "Mana Lord's Moon Light Theme";
        "workbench.iconTheme" = "material-icon-theme";
        "workbench.activityBar.location" = "hidden";
        "workbench.editor.showTabs" = "single";
        "workbench.statusBar.visible" = false;
        "workbench.startupEditor" = "none";
        "workbench.sideBar.location" = "right";
        "workbench.tips.enabled" = false;
        "workbench.tree.enableStickyScroll" = false;
        "workbench.tree.renderIndentGuides" = "none";
        "workbench.tree.indent" = 8;

        "explorer.compactFolders" = false;
        "explorer.confirmDragAndDrop" = false;
        "explorer.confirmDelete" = false;
        "explorer.decorations.badges" = false;

        "git.decorations.enabled" = false;

        "breadcrumbs.enabled" = false;

        "material-icon-theme.hidesExplorerArrows" = true;

        "terminal.integrated.fontSize" = 14;
        "terminal.integrated.fontFamily" = "ComicShannsMono Nerd Font";
        "telemetry.telemetryLevel" = "off";

        "window.menuBarVisibility" = "toggle";
        "window.titleBarStyle" = "native";
        "window.customTitleBarVisibility" = "never";

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

        # "nix.enableLanguageServer" = true;
        # "nix.serverPath" = "${pkgs.nixd}/bin/nixd";
        # "nix.serverSettings" = {
        #   "nixd" = {
        #     "formatting" = {
        #       "command" = [ "${pkgs.nixfmt-rfc-style}/bin/nixfmt" ];
        #     };
        #   };
        # };
      };
      extensions = with pkgs.vscode-marketplace; [
        manalord.mana-lord-theme
        miguelsolorio.fluent-icons
        golang.go
        # jnoortheen.nix-ide
        supermaven.supermaven
        pkief.material-icon-theme
        # rust-lang.rust-analyzer
        # vadimcn.vscode-lldb
        # tamasfe.even-better-toml
        # fill-labs.dependi
      ];
    };
  };
}
