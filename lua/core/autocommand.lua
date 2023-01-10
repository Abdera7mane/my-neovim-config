vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

vim.cmd([[
  augroup language_user_config
    autocmd!
    autocmd FileType gdscript setlocal noexpandtab
  augroup end
]])

