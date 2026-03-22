return {
  'mg979/vim-visual-multi',
  branch = 'master',
  init = function()
    -- optional: configure before plugin loads
    vim.g.VM_maps = {
      ['Find Under'] = '<C-n>', -- start multicursor on word
      ['Find Subword Under'] = '<C-n>',
    }
  end,
}
