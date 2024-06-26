vim.opt.background = "dark" -- set this to dark or light
function ColorMyPencils(color)
    color = color or "oxocarbon"
    vim.cmd.colorscheme(color)
end

ColorMyPencils()

-- Border colors override for oxocarbon
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#ffffff", bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#ffffff", bg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#ffffff", bg = "NONE" })
vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = "#ffffff", bg = "NONE" })
vim.api.nvim_set_hl(0, "NotifyWARNBorder", { fg = "#ffffff", bg = "NONE" })
vim.api.nvim_set_hl(0, "NotifyINFOBorder", { fg = "#ffffff", bg = "NONE" })
vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { fg = "#ffffff", bg = "NONE" })
vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { fg = "#ffffff", bg = "NONE" })

-- Tab color override for oxocarbon
vim.api.nvim_set_hl(0, "TabLineFill", { fg = "#262626", bg = "#78a9ff" })
vim.api.nvim_set_hl(0, "TabLine", { fg = "#ffffff", bg = "#262626" })
vim.api.nvim_set_hl(0, "TabLineSel", { fg = "#262626", bg = "#ffffff" })
