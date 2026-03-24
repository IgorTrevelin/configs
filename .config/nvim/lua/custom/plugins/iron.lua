return {
  'Vigemus/iron.nvim',
  config = function()
    local iron = require 'iron.core'

    iron.setup {
      config = {
        scratch_repl = true,
        repl_definition = {
          sh = {
            command = { 'zsh' }, -- or "bash"
          },
          python = {
            command = { 'python3' }, -- or { "ipython", "--no-autoindent" }
          },
        },
        repl_open_cmd = require('iron.view').right(40),
      },
      keymaps = {
        send_motion = '<space>rc',
        visual_send = '<space>rc',
        send_file = '<space>rf',
        send_line = '<space>rl',
        send_paragraph = '<space>sp',
        send_mark = '<space>rm',
        cr = '<space>r<cr>',
        interrupt = '<space>r<space>',
        exit = '<space>rq',
        clear = '<space>rx',
      },
      highlight = { italic = true },
      ignore_blank_lines = true,
    }

    -- Extra commands
    vim.keymap.set('n', '<space>rs', '<cmd>IronRepl<cr>')
    vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>')
    vim.keymap.set('n', '<space>rF', '<cmd>IronFocus<cr>')
    vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')
  end,
}
