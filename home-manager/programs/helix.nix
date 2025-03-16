{
  lib,
  pkgs,
  ...
}:
{
  stylix.targets.helix.enable = false;
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "tokyonight";
      editor = {
        soft-wrap.enable = true;
        color-modes = true;
        cursorline = true;
        completion-replace = true;
        end-of-line-diagnostics = "hint";
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";

        };
        file-picker.hidden = false;
        true-color = true;

        gutters = [
          "diff"
          "diagnostics"
          "line-numbers"
          "spacer"
        ];
        statusline = {
          left = [
            "mode"
            "spinner"
          ];
          center = [ "file-name" ];
          right = [
            "diagnostics"
            "selections"
            "position"
            "file-line-ending"
            "file-type"
            "version-control"
          ];
          separator = "|";
          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
        };
        lsp = {
          enable = true;
          display-messages = true;
          display-progress-messages = true;
          auto-signature-help = true;
          display-inlay-hints = true;
          display-signature-help-docs = true;
          snippets = true;
          goto-reference-include-declaration = true;
        };
        indent-guides = {
          render = true;
          rainbow = "dim";
          character = "┆";
        };
        whitespace = {
          characters = {
            space = "·";
            nbsp = "⍽";
            tab = "→";
            newline = "⏎";
            tabpad = "·";
          };
        };
      };
    };
    languages = {
      language-server = {
        nixd.command = lib.getExe pkgs.nixd;
        gopls.command = lib.getExe pkgs.gopls;
        # rust-analyzer.command = lib.getExe pkgs.rust-analyzer;
      };
      language = [
        {
          name = "nix";
          language-servers = [ "nixd" ];
          auto-format = true;
          formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
        }
        {
          name = "go";
          language-servers = [ "gopls" ];
          auto-format = true;
          formatter.command = lib.getExe pkgs.gosimports;
        }
        # {
        #   name = "rust";
        #   auto-format = true;
        #   formatter.command = lib.getExe pkgs.rustfmt;
        # }
      ];
    };
  };
}
