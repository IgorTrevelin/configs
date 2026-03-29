return {
  'mg979/vim-visual-multi',
  branch = 'master',
  init = function()
    -- init.lua (Lua config)
    vim.g.VM_maps = {
      ['Find Under'] = '<C-n>', -- keep default
      -- ['Cursor Down'] = 'J',
      -- ['Cursor Up'] = 'K',
      -- ['Cursor Left'] = 'H',
      -- ['Cursor Right'] = 'L',
    }
  end,
}
