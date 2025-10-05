local config = function()
  require("mini.align").setup()
  require("mini.ai").setup()
  require("mini.pairs").setup()
  require("mini.comment").setup()
  require("mini.operators").setup()
end

return {
  "nvim-mini/mini.nvim",
  lazy = true,
  event = "BufReadPre",
  version = false,
  config = config,
}
