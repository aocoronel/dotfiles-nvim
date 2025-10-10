----------------------
-- LazyVim Settings --
----------------------

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- LazyVim auto format
vim.g.autoformat = true

-- Set to `false` to globally disable all snacks animations
vim.g.snacks_animate = false

-- Can be one of: telescope, fzf
-- Leave it to "auto" to automatically use the picker
vim.g.lazyvim_picker = "auto"

-- Can be one of: nvim-cmp, blink.cmp
-- Leave it to "auto" to automatically use the completion engine
vim.g.lazyvim_cmp = "auto"

vim.g.ai_cmp = false
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

-- Hide deprecation warnings
vim.g.deprecation_warnings = false

-- Show the current document symbols location from Trouble in lualine
-- You can disable this for a buffer by setting `vim.b.trouble_lualine = false`
-- vim.g.trouble_lualine = true

local opt = vim.opt

-- vim.g.root_lsp_ignore = { "copilot" }

local opt = vim.opt

opt.autowrite = true -- Enable auto write
-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically.
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
opt.foldlevel = 99
opt.foldmethod = "indent"
opt.foldtext = ""
-- opt.formatexpr = "v:lua.LazyVim.format.formatexpr()"
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.jumpoptions = "view"
opt.laststatus = 3 -- global statusline
opt.linebreak = true -- Wrap lines at convenient points
opt.list = true -- Show some invisible characters (tabs...
opt.mouse = "a" -- Enable mouse mode
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = true -- Relative line numbers
opt.ruler = false -- Disable the default ruler
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.smoothscroll = true
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
-- opt.statuscolumn = [[%!v:lua.LazyVim.statuscolumn()]]
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

----------------------
--      Custom      --
----------------------

opt.incsearch = true
opt.hlsearch = true
opt.softtabstop = 2

opt.nu = true
opt.colorcolumn = "100"
opt.cmdheight = 1

opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.local/share/vim/undodir"
opt.backspace = "indent,eol,start"
opt.autochdir = true
opt.iskeyword:append("-")
opt.modifiable = true

opt.spell = false
opt.encoding = "UTF-8"
opt.spelllang = "pt,en_us"

vim.diagnostic.enable = true
vim.diagnostic.config({
  virtual_lines = false,
})

-- Auto LSP Pop Up

vim.o.updatetime = 500
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})

----------------------
-- Linkarzu Options Config
----------------------

-- opt.fillchars = {
--   foldopen = "",
--   foldclose = "",
--   fold = " ",
--   foldsep = " ",
--   diff = "╱",
--   eob = " ",
-- }
-- opt.foldlevel = 99
-- opt.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"
-- if vim.fn.has("nvim-0.10") == 1 then
--   opt.smoothscroll = true
--   opt.foldmethod = "expr"
--   opt.foldexpr = "nvim_treesitter#foldexpr()"
--   opt.foldtext = ""
-- else
--   opt.foldmethod = "indent"
--   opt.foldtext = "v:lua.require'lazyvim.util'.ui.foldtext()"
-- end
-- vim.g.markdown_recommended_style = 0

local function shorten_path(path)
  local shorten_if_more_than = 6 -- change this to 5, 7, etc
  -- Strip and remember the root ("/" or "~/")
  local prefix = ""
  if path:sub(1, 2) == "~/" then
    prefix = "~/"
    path = path:sub(3)
  elseif path:sub(1, 1) == "/" then
    prefix = "/"
    path = path:sub(2)
  end
  -- Split the remaining path into its components
  local parts = {}
  for part in string.gmatch(path, "[^/]+") do
    table.insert(parts, part)
  end
  -- Shorten only when there are more than shorten_if_more_than directories
  if #parts > shorten_if_more_than then
    local first = parts[1]
    local last_four = table.concat({
      parts[#parts - 3],
      parts[#parts - 2],
      parts[#parts - 1],
      parts[#parts],
    }, "/")
    return prefix .. first .. "/../" .. last_four
  end

  -- Re-attach the prefix when no shortening is needed
  return prefix .. table.concat(parts, "/")
end
-- Function to get the full path and replace the home directory with ~
local function get_winbar_path()
  local full_path = vim.fn.expand("%:p:h")
  return full_path:gsub(vim.fn.expand("$HOME"), "~")
end
-- Function to get the number of open buffers using the :ls command
local function get_buffer_count()
  return vim.fn.len(vim.fn.getbufinfo({ buflisted = 1 }))
end
-- Function to update the winbar
local function update_winbar()
  local home_replaced = get_winbar_path()
  local buffer_count = get_buffer_count()
  local display_path = shorten_path(home_replaced)
  vim.opt.winbar = "%#WinBar1#%m "
    .. "%#WinBar2#("
    .. buffer_count
    .. ") "
    -- this shows the filename on the left
    .. "%#WinBar3#"
    .. vim.fn.expand("%:t")
    -- This shows the file path on the right
    .. "%*%=%#WinBar1#"
    .. display_path
  -- I don't need the hostname as I have it in lualine
  -- .. vim.fn.systemlist("hostname")[1]
end
-- Winbar was not being updated after I left lazygit
vim.api.nvim_create_autocmd({ "BufEnter", "ModeChanged" }, {
  callback = function(args)
    local old_mode = args.event == "ModeChanged" and vim.v.event.old_mode or ""
    local new_mode = args.event == "ModeChanged" and vim.v.event.new_mode or ""
    -- Only update if ModeChanged is relevant (e.g., leaving LazyGit)
    if args.event == "ModeChanged" then
      -- Get buffer filetype
      local buf_ft = vim.bo.filetype
      -- Only update when leaving `snacks_terminal` (LazyGit)
      if buf_ft == "snacks_terminal" or old_mode:match("^t") or new_mode:match("^n") then
        update_winbar()
      end
    else
      update_winbar()
    end
  end,
})
