set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" FZF (depends on neovim and ripgrep)
" Credit: aeolyus/dotfiles
let $FZF_DEFAULT_COMMAND =  "rg --files --hidden 2>/dev/null"
let $FZF_DEFAULT_OPTS=' --color=dark
       \ --color=fg:8,bg:11,hl:7,fg+:7,bg+:0,hl+:9
       \ --color=gutter:11,info:3,prompt:4,pointer:9,spinner:4
       \ --layout=reverse --margin=1,3'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
let g:fzf_commands_expect = 'ctrl-t'

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')
  let height = float2nr(min([10, &lines/2]))
  let width = float2nr(min([80, &columns/2]))
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = 2
  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal',
        \ }
  call nvim_open_win(buf, v:true, opts)
endfunction
