vim.cmd([[
syntax match   gitcommitSummary    "^.\{0,72\}" contained containedin=gitcommitFirstLine nextgroup=gitcommitOverflow contains=@Spell
]])