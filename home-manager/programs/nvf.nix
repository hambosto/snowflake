{ inputs, ... }:
{
  imports = [ inputs.nvf.homeManagerModules.default ];

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;

        enableLuaLoader = true;
        syntaxHighlighting = true;
        lineNumberMode = "number";
        useSystemClipboard = true;
        preventJunkFiles = true;

        undoFile.enable = true;
        notify.nvim-notify.enable = true;
        telescope.enable = true;
        globals.editorconfig = true;

        options = {
          tabstop = 2;
          shiftwidth = 2;
          expandtab = true;

          autoindent = true;
        };

        binds = {
          cheatsheet.enable = true;
          whichKey.enable = true;
        };

        dashboard = {
          dashboard-nvim.enable = true;
          alpha.enable = true;
          startify.enable = true;
        };

        statusline.lualine = {
          enable = true;
          globalStatus = true;
          icons.enable = true;
        };

        tabline.nvimBufferline = {
          enable = true;

          mappings = {
            cycleNext = "<leader>e";
            cyclePrevious = "<leader>q";
          };
        };

        terminal.toggleterm = {
          enable = true;
          lazygit.enable = true;
        };

        autopairs.nvim-autopairs.enable = true;

        autocomplete.nvim-cmp = {
          enable = true;

          mappings = {
            close = "<C-e>"; # ctrl-e
            complete = "<C-Space>"; # ctrl-space
            confirm = "<CR>"; # return
            next = "<Tab>";
            previous = "<S-Tab>";
            scrollDocsDown = "<C-f>";
            scrollDocsUp = "<C-d>";
          };
        };

        comments.comment-nvim = {
          enable = true;

          mappings = {
            toggleCurrentLine = "<C-l>"; # ctrl-/
          };
        };

        debugger.nvim-dap = {
          enable = true;

          ui = {
            enable = true;
            autoStart = true;
          };
        };

        filetree.nvimTree = {
          enable = true;

          mappings = {
            toggle = "<C-n>";
          };
        };

        git = {
          enable = true;

          gitsigns = {
            enable = true;
            codeActions.enable = true;
          };
        };

        languages = {
          enableDAP = true;
          enableExtraDiagnostics = true;
          enableFormat = true;
          enableLSP = true;
          enableTreesitter = true;

          go = {
            enable = true;
            format.enable = true;
            lsp.enable = true;
            treesitter.enable = true;
          };

          nix = {
            enable = true;
            extraDiagnostics.enable = true;
            format.enable = true;
            lsp.enable = true;
            treesitter.enable = true;
          };
        };

        snippets.luasnip.enable = true;

        lsp = {
          enable = true;
          formatOnSave = true;
          lightbulb.enable = true;
          lspSignature.enable = true;
          lspconfig.enable = true;
          lsplines.enable = true;
          nvim-docs-view.enable = true;
          trouble.enable = true;
          lspkind.enable = true;
          lspsaga.enable = true;
        };

        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
          transparent = true;
        };

        treesitter.context.enable = true;

        ui = {
          borders.enable = true;
          colorizer.enable = true;
          illuminate.enable = true;
          modes-nvim.enable = true;
          noice.enable = true;
          smartcolumn.enable = true;
        };

        visuals = {
          nvim-cursorline.enable = true;
          indent-blankline.enable = true;
          nvim-web-devicons.enable = true;
          highlight-undo.enable = true;
        };
      };
    };
  };
}
