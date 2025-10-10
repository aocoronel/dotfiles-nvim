local config = function()
  -- local lspconfig = require("lspconfig")
  local lspconfig = vim.lsp

  -- lua
  lspconfig.enable("lua_ls")
  lspconfig.config("lua_ls", {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            vim.fn.expand("$VIMRUNTIME/lua"),
            vim.fn.expand("$XDG_CONFIG_HOME") .. "/nvim/lua",
          },
        },
      },
    },
  })

  -- Odin
  -- lspconfig.enable("ols")
  -- lspconfig.config("ols", {
  --   cmd = { "ols" },
  --   filetypes = { "odin" },
  -- })

  -- Nix
  -- lspconfig.enable("nix_ls")
  -- lspconfig.config("nix_ls", {
  --   cmd = { "nil" },
  --   filetypes = { "nix" },
  --   root_markers = { "flake.nix", ".git" },
  -- })

  -- json
  -- lspconfig.enable("jsonls")
  -- lspconfig.config("jsonls", {
  --   filetypes = { "json", "jsonc" },
  --   init_options = {
  --     provideFormatter = true,
  --   },
  -- })

  -- python
  -- lspconfig.enable("pyright")
  -- lspconfig.config("pyright", {
  --   settings = {
  --     pyright = {
  --       disableOrganizeImports = false,
  --       analysis = {
  --         useLibraryCodeForTypes = true,
  --         autoSearchPaths = true,
  --         diagnosticMode = "workspace",
  --         autoImportCompletions = true,
  --       },
  --     },
  --   },
  -- })

  -- golang
  -- lspconfig.enable("gopls")
  -- lspconfig.config("gopls", {
  --   filetypes = {
  --     "go",
  --     "gomod",
  --     "gowork",
  --     "gotmpl",
  --   },
  -- })

  -- typescript
  -- lspconfig.enable("ts_ls")
  -- lspconfig.config("ts_ls", {
  --   filetypes = {
  --     "typescript",
  --     "javascript",
  --     "typescriptreact",
  --     "javascriptreact",
  --   },
  --   commands = {},
  --   settings = {
  --     typescript = {
  --       indentStyle = "space",
  --       indentSize = 2,
  --     },
  --   },
  -- })

  -- bash
  lspconfig.enable("bashls")
  lspconfig.config("bashls", {
    filetypes = { "sh", "aliasrc" },
    settings = {
      bashIde = {
        globPattern = "*@(.sh|.inc|.bash|.command)",
      },
    },
  })

  -- markdown
  lspconfig.enable("marksman")
  lspconfig.config("marksman", {
    filetypes = { "markdown", "markdown.mdx" },
  })
  lspconfig.enable("markdown_oxide")
  lspconfig.config("markdown_oxide", {
    filetypes = { "markdown" },
  })

  -- rust
  -- lspconfig.config("bacon_ls", {
  -- lspconfig.enable("bacon_ls")
  --   filetypes = { "rust" },
  -- })

  -- C/C++
  lspconfig.enable("clangd")
  lspconfig.config("clangd", {
    capabilities = {
      offsetEncoding = { "utf-8", "utf-16" },
    },
    textDocument = {
      completion = {
        editsNearCursor = true,
      },
    },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
    keys = {
      { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
    },
    root_markers = {
      ".clangd",
      ".clang-tidy",
      ".clang-format",
      "compile_commands.json",
      "compile_flags.txt",
      "configure.ac", -- AutoTools
      "Makefile",
      "configure.ac",
      "configure.in",
      "config.h.in",
      "meson.build",
      "meson_options.txt",
      "build.ninja",
      ".git",
    },
    cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "--header-insertion=iwyu",
      "--completion-style=detailed",
      "--function-arg-placeholders",
      "--fallback-style=llvm",
    },
    init_options = {
      usePlaceholders = true,
      completeUnimported = true,
      clangdFileStatus = true,
      fallbackFlags = { "-std=c99" },
    },
  })

  local prettier_d = require("efmls-configs.formatters.prettier_d")
  local luacheck = require("efmls-configs.linters.luacheck")
  local stylua = require("efmls-configs.formatters.stylua")
  local flake8 = require("efmls-configs.linters.flake8")
  local black = require("efmls-configs.formatters.black")
  local eslint = require("efmls-configs.linters.eslint")
  local fixjson = require("efmls-configs.formatters.fixjson")
  local shellcheck = require("efmls-configs.linters.shellcheck")
  local shfmt = require("efmls-configs.formatters.shfmt")
  local hadolint = require("efmls-configs.linters.hadolint")
  local cpplint = require("efmls-configs.linters.cpplint")
  local clangformat = require("efmls-configs.formatters.clang_format")

  lspconfig.enable("efm")
  lspconfig.config("efm", {
    filetypes = {
      "lua",
      "python",
      "json",
      "jsonc",
      "sh",
      "javascript",
      "javascriptreact",
      -- "typescript",
      -- "typescriptreact",
      -- "svelte",
      -- "vue",
      "docker",
      "html",
      "css",
      "c",
      "cpp",
    },
    init_options = {
      documentFormatting = true,
      documentRangeFormatting = true,
      hover = true,
      documentSymbol = true,
      codeAction = true,
      completion = true,
    },
    settings = {
      languages = {
        lua = { luacheck, stylua },
        python = { flake8, black },
        -- typescript = { eslint, prettier_d },
        json = { eslint, fixjson },
        jsonc = { eslint, fixjson },
        sh = { shellcheck, shfmt },
        javascript = { eslint, prettier_d },
        -- javascriptreact = { eslint, prettier_d },
        -- typescriptreact = { eslint, prettier_d },
        -- svelte = { eslint, prettier_d },
        -- vue = { eslint, prettier_d },
        docker = { hadolint, prettier_d },
        html = { prettier_d },
        css = { prettier_d },
        c = { clangformat, cpplint },
        cpp = { clangformat, cpplint },
      },
    },
  })
end

return {
  "neovim/nvim-lspconfig",
  config = config,
  event = "BufReadPre",
  lazy = true,
  dependencies = {
    "mason-org/mason.nvim",
    "creativenull/efmls-configs-nvim",
  },
  opts = {
    servers = {
      marksman = {
        cmd = {
          "sh",
          "-c",
          "test -x /run/current-system/sw/bin/marksman && { /run/current-system/sw/bin/marksman server; } || { marksman server; }",
        },
      },
      markdown_oxide = {
        cmd = {
          "sh",
          "-c",
          "test -x /run/current-system/sw/bin/markdown-oxide && { /run/current-system/sw/bin/markdown-oxide server; } || { markdown-oxide server; }",
        },
      },
    },
  },
}
