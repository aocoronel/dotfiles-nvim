local keymap = vim.keymap

-- Toggle Spelling

keymap.set("n", "<leader>ts", ":set spell!<CR>", { noremap = true, silent = true, desc = "Toggle: [S]pell" })

-- Managing files

keymap.set("n", "<M-h>", ":cnext<CR>", { desc = "Next QuickFix" })
keymap.set("n", "<M-l>", ":cprev<CR>", { desc = "Previous QuickFix" })

-- File Permissions

keymap.set("n", "<leader>cx", ":!chmod +x %<cr>", { desc = "Make Executable" })

-- Search and Replace

keymap.set("v", "<leader>ss", ":s/", { desc = "Search & Replace" })
keymap.set("n", "<leader>ss", ":%s/", { desc = "Search & Replace" })

-- Sort

keymap.set("v", "<leader>sS", ":!sort<CR>", { desc = "Sort" })

-- Managing lines

keymap.set("i", "<Tab>", "<C-o>>>", { noremap = true, silent = true })
keymap.set("i", "<S-Tab>", "<C-o><<", { noremap = true, silent = true })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true }) -- Shift + K in Visual Mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true }) -- Shift + J in Visual Mode

-- Motion

keymap.set("n", "<C-u>", "<C-u>zz") -- Page Up and Center
keymap.set("n", "<C-d>", "<C-d>zz") -- Page Down and Center

keymap.set("n", "n", "nzzzv") -- Next and Center
keymap.set("n", "N", "Nzzzv") -- Previous and Center

-- Visual

keymap.set("n", "<leader>h", ":noh<cr>") -- Remove highlight

-- Panes

keymap.set("n", "<C-h>", "<C-w>h") -- Navigate Left
keymap.set("n", "<C-j>", "<C-w>j") -- Navigate Down
keymap.set("n", "<C-k>", "<C-w>k") -- Navigate Up
keymap.set("n", "<C-l>", "<C-w>l") -- Navigate Right
keymap.set("n", "<C-h>", "TmuxNavigateLeft") -- Navigate Left
keymap.set("n", "<C-j>", "TmuxNavigateDown") -- Navigate Down
keymap.set("n", "<C-k>", "TmuxNavigateUp") -- Navigate Up
keymap.set("n", "<C-l>", "TmuxNavigateRight") -- Navigate Right
keymap.set("n", "<leader>mz", ":Maximize<CR>") -- Maximize current pane

-- Indenting

keymap.set("v", "<", "<gv") -- Allows multiple indents without losing cursor
keymap.set("v", ">", ">gv") -- Allows multiple indents without losing cursor

-- URL

keymap.set("n", "<leader>gx", ":!xdg-open <c-r><c-a>", { desc = "Follow URL" })

-- LSP

keymap.set("n", "<leader>fmd", vim.lsp.buf.format, { desc = "[L]SP Format" })

-- Plugins

keymap.set("n", "<leader>cc", ":CsvViewToggle display_mode=border header_lnum=1", { desc = "[C]SV View" })

-- Zoxide

-- keymap.set("n", "<leader>gz", ":FzfLua zoxide<CR>", { desc = "[Z]oxide" })

-- Footnotes

-- keymap.set("n", "<leader>fmf", ":lua require('footnote').organize_footnotes()<CR>", { desc = "[F]ootnote Organize" })

-- Obsidian

-- keymap.set("n", "<leader>oq", ":ObsidianQuickSwitch<cr>", { desc = "[Q]uick Switch" })
-- keymap.set("n", "<leader>ow", ":ObsidianWorkspace<cr>", { desc = "[W]orkspace" })
-- keymap.set("n", "<leader>or", ":ObsidianRename<cr>", { desc = "[R]ename" })
-- keymap.set("n", "<leader>os", ":ObsidianSearch<cr>", { desc = "[S]earch" })
-- keymap.set("n", "<leader>oc", ":ObsidianTOC<cr>", { desc = "To[C]" })
-- keymap.set("n", "<leader>om", ":ObsidianTags<cr>", { desc = "[M]arks" })
-- keymap.set("n", "<leader>ot", ":ObsidianTemplate<cr>", { desc = "[T]emplate" })
-- keymap.set("n", "<leader>dd", ":ObsidianToday<cr>", { desc = "[D]aily Note" })

-- Links

-- keymap.set("n", "<leader>ol", "viw:ObsidianLink<cr>", { desc = "[L]ink" }) -- Link under cursor
-- keymap.set("v", "<leader>oL", ":ObsidianLink<cr>", { desc = "[L]ink" }) -- Link in visual mode
--
-- keymap.set("n", "<leader>ob", ":ObsidianBacklinks<cr>", { desc = "[B]acklinks" })
--
-- keymap.set("n", "<leader>oB", ":ObsidianLinks<cr>", { desc = "Coming Links" })

-- Others

-- keymap.set("n", "<leader>oz", ":ObsidianCheck<cr>", { desc = "Check plugin" })

-- Bufferline

-- keymap.set("n", "<M-n>", ":BufferLineCycleNext<CR>") -- Next Buffer
-- keymap.set("n", "<M-p>", ":BufferLineCyclePrev<CR>") -- Previous Buffer
-- keymap.set("n", "<M-1>", ":BufferLineGoToBuffer 1<CR>") -- Move to Buffer
-- keymap.set("n", "<M-2>", ":BufferLineGoToBuffer 2<CR>") -- Move to Buffer
-- keymap.set("n", "<M-3>", ":BufferLineGoToBuffer 3<CR>") -- Move to Buffer
-- keymap.set("n", "<M-4>", ":BufferLineGoToBuffer 4<CR>") -- Move to Buffer
-- keymap.set("n", "<M-5>", ":BufferLineGoToBuffer 5<CR>") -- Move to Buffer
-- keymap.set("n", "<M-6>", ":BufferLineGoToBuffer 6<CR>") -- Move to Buffer
-- keymap.set("n", "<M-7>", ":BufferLineGoToBuffer 7<CR>") -- Move to Buffer
-- keymap.set("n", "<M-8>", ":BufferLineGoToBuffer 8<CR>") -- Move to Buffer
-- keymap.set("n", "<M-9>", ":BufferLineGoToBuffer 9<CR>") -- Move to Buffer

-- LazyVim

-- better up/down
-- keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
-- keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
-- keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
-- keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
-- keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
-- keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
-- keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
-- keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
-- keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
-- keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
-- keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
-- keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
-- keymap.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
-- keymap.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
-- keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
-- keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
-- keymap.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
-- keymap.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- buffers
-- keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
-- keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
-- keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
-- keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
-- keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
-- keymap.set("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
-- keymap.set("n", "<leader>bd", function()
--   Snacks.bufdelete()
-- end, { desc = "Delete Buffer" })
-- keymap.set("n", "<leader>bo", function()
--   Snacks.bufdelete.other()
-- end, { desc = "Delete Other Buffers" })
-- keymap.set("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- Clear search and stop snippet on escape
-- keymap.set({ "i", "n", "s" }, "<esc>", function()
--   vim.cmd("noh")
--   LazyVim.cmp.actions.snippet_stop()
--   return "<esc>"
-- end, { expr = true, desc = "Escape and Clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
-- keymap.set(
--   "n",
--   "<leader>ur",
--   "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
--   { desc = "Redraw / Clear hlsearch / Diff Update" }
-- )

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- keymap.set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
-- keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
-- keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
-- keymap.set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
-- keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
-- keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Add undo break-points
-- keymap.set("i", ",", ",<c-g>u")
-- keymap.set("i", ".", ".<c-g>u")
-- keymap.set("i", ";", ";<c-g>u")

-- save file
-- keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

--keywordprg
-- keymap.set("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- better indenting
-- keymap.set("v", "<", "<gv")
-- keymap.set("v", ">", ">gv")

-- commenting
-- keymap.set("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
-- keymap.set("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- lazy
-- keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
-- keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- location list
-- keymap.set("n", "<leader>xl", function()
--   local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
--   if not success and err then
--     vim.notify(err, vim.log.levels.ERROR)
--   end
-- end, { desc = "Location List" })

-- quickfix list
-- keymap.set("n", "<leader>xq", function()
--   local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
--   if not success and err then
--     vim.notify(err, vim.log.levels.ERROR)
--   end
-- end, { desc = "Quickfix List" })
--
-- keymap.set("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
-- keymap.set("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- formatting
-- keymap.set({ "n", "v" }, "<leader>cf", function()
--   LazyVim.format({ force = true })
-- end, { desc = "Format" })

-- diagnostic
-- local diagnostic_goto = function(next, severity)
--   return function()
--     vim.diagnostic.jump({
--       count = (next and 1 or -1) * vim.v.count1,
--       severity = severity and vim.diagnostic.severity[severity] or nil,
--       float = true,
--     })
--   end
-- end
-- keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
-- keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
-- keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
-- keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
-- keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
-- keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
-- keymap.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- stylua: ignore start

-- toggle options
-- LazyVim.format.snacks_toggle():map("<leader>uf")
-- LazyVim.format.snacks_toggle(true):map("<leader>uF")
-- Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
-- Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
-- Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
-- Snacks.toggle.diagnostics():map("<leader>ud")
-- Snacks.toggle.line_number():map("<leader>ul")
-- Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = "Conceal Level" }):map("<leader>uc")
-- Snacks.toggle.option("showtabline", { off = 0, on = vim.o.showtabline > 0 and vim.o.showtabline or 2, name = "Tabline" }):map("<leader>uA")
-- Snacks.toggle.treesitter():map("<leader>uT")
-- Snacks.toggle.option("background", { off = "light", on = "dark" , name = "Dark Background" }):map("<leader>ub")
-- Snacks.toggle.dim():map("<leader>uD")
-- Snacks.toggle.animate():map("<leader>ua")
-- Snacks.toggle.indent():map("<leader>ug")
-- Snacks.toggle.scroll():map("<leader>uS")
-- Snacks.toggle.profiler():map("<leader>dpp")
-- Snacks.toggle.profiler_highlights():map("<leader>dph")

-- if vim.lsp.inlay_hint then
--   Snacks.toggle.inlay_hints():map("<leader>uh")
-- end

-- lazygit
-- if vim.fn.executable("lazygit") == 1 then
--   map("n", "<leader>gg", function() Snacks.lazygit( { cwd = LazyVim.root.git() }) end, { desc = "Lazygit (Root Dir)" })
--   map("n", "<leader>gG", function() Snacks.lazygit() end, { desc = "Lazygit (cwd)" })
-- end

-- keymap.set("n", "<leader>gL", function() Snacks.picker.git_log() end, { desc = "Git Log (cwd)" })
-- keymap.set("n", "<leader>gb", function() Snacks.picker.git_log_line() end, { desc = "Git Blame Line" })
-- keymap.set("n", "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "Git Current File History" })
-- keymap.set("n", "<leader>gl", function() Snacks.picker.git_log({ cwd = LazyVim.root.git() }) end, { desc = "Git Log" })
-- keymap.set({ "n", "x" }, "<leader>gB", function() Snacks.gitbrowse() end, { desc = "Git Browse (open)" })
-- keymap.set({"n", "x" }, "<leader>gY", function()
--   Snacks.gitbrowse({ open = function(url) vim.fn.setreg("+", url) end, notify = false })
-- end, { desc = "Git Browse (copy)" })

-- quit
-- keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- highlights under cursor
-- keymap.set("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
-- keymap.set("n", "<leader>uI", function() vim.treesitter.inspect_tree() vim.api.nvim_input("I") end, { desc = "Inspect Tree" })

-- LazyVim Changelog
-- keymap.set("n", "<leader>L", function() LazyVim.news.changelog() end, { desc = "LazyVim Changelog" })

-- floating terminal
-- keymap.set("n", "<leader>fT", function() Snacks.terminal() end, { desc = "Terminal (cwd)" })
-- keymap.set("n", "<leader>ft", function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)" })
-- keymap.set({"n","t"}, "<c-/>",function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)" })
-- keymap.set({"n","t"}, "<c-_>",function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "which_key_ignore" })

-- windows
-- keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
-- keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
-- keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
-- Snacks.toggle.zoom():map("<leader>wm"):map("<leader>uZ")
-- Snacks.toggle.zen():map("<leader>uz")

-- tabs
-- keymap.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
-- keymap.set("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
-- keymap.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
-- keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
-- keymap.set("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
-- keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
-- keymap.set("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
