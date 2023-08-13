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
    autocmd FileType rust setlocal noexpandtab
    autocmd FileType rust setlocal tabstop=2
    autocmd FileType rust setlocal shiftwidth=2
  augroup end
]])

