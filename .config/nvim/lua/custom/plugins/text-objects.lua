return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  branch = 'main',
  init = function()
    -- Disable entire built-in ftplugin mappings to avoid conflicts.
    -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
    vim.g.no_plugin_maps = true

    -- Or, disable per filetype (add as you like)
    -- vim.g.no_python_maps = true
    -- vim.g.no_ruby_maps = true
    -- vim.g.no_rust_maps = true
    -- vim.g.no_go_maps = true
  end,
  config = function()
    require('nvim-treesitter-textobjects').setup {
      select = {
        lookahead = true,
        selection_modes = {
          ['@function.outer'] = 'V', -- linewise
          ['@parameter.outer'] = 'v', -- charwise
        },
        include_surrounding_whitespace = false,
      },
    }
    vim.keymap.set({ 'x', 'o' }, 'af', function() require('nvim-treesitter-textobjects.select').select_textobject('@function.outer', 'textobjects') end)
    vim.keymap.set({ 'x', 'o' }, 'if', function() require('nvim-treesitter-textobjects.select').select_textobject('@function.inner', 'textobjects') end)
    vim.keymap.set({ 'x', 'o' }, 'ac', function() require('nvim-treesitter-textobjects.select').select_textobject('@class.outer', 'textobjects') end)
    vim.keymap.set({ 'x', 'o' }, 'ic', function() require('nvim-treesitter-textobjects.select').select_textobject('@class.inner', 'textobjects') end)
    vim.keymap.set({ 'x', 'o' }, 'aa', function() require('nvim-treesitter-textobjects.select').select_textobject('@parameter.outer', 'textobjects') end)
    vim.keymap.set({ 'x', 'o' }, 'ia', function() require('nvim-treesitter-textobjects.select').select_textobject('@parameter.inner', 'textobjects') end)
    vim.keymap.set({ 'n', 'x', 'o' }, ']f', function() require('nvim-treesitter-textobjects.move').goto_next_start('@function.outer', 'textobjects') end)
    vim.keymap.set({ 'n', 'x', 'o' }, '[f', function() require('nvim-treesitter-textobjects.move').goto_previous_start('@function.outer', 'textobjects') end)
    vim.keymap.set({ 'n', 'x', 'o' }, ']c', function() require('nvim-treesitter-textobjects.move').goto_next_start('@class.outer', 'textobjects') end)
    vim.keymap.set({ 'n', 'x', 'o' }, '[c', function() require('nvim-treesitter-textobjects.move').goto_previous_start('@class.outer', 'textobjects') end)

    vim.keymap.set('n', '<leader>sn', function() require('nvim-treesitter-textobjects.swap').swap_next '@parameter.inner' end)
    vim.keymap.set('n', '<leader>sp', function() require('nvim-treesitter-textobjects.swap').swap_previous '@parameter.outer' end)
  end,
}
