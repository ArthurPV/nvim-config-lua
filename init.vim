lua require 'init'

aug RestoreCursorShapeOnExist
	au!
	au VimLeave, VimSuspend * set guicursor=a:ver30
	au VimEnter, VimResume * set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
aug END

" run code
let g:run_code = {
	\ 'cpp': { 'build': ['g++ -std=c++17 %s', '%'],  'run': ['cat input | ./a.out'] },
	\ 'python': { 'build': [''],                     'run': ['cat input | python %s', '%'] },
	\ 'javascript': { 'build':  [''],                'run': ['cat input | node %s', '%'] },
	\ 'rust': { 'build': ['rustc %s -o a.out', '%'], 'run': ['cat input | ./a.out'] },
	\ }

set fdm=marker fdl=0

" Keybinding

nn <silent> <leader>b :call TermBufMExecCodeScript(&filetype, 'build')<CR>
nn <silent> <leader>r :call TermBufMExecCodeScript(&filetype, 'run')<CR>
nn <silent> <leader>f :call TermBufMExec('pbpaste > input')<CR>
nn <silent> <leader><space> :call TermBufMToggle()<CR>

let g:highlightedyank_highlight_duration = 300
runtime macros/sandwich/keymap/surround.vim
call operator#sandwich#set('all', 'all', 'highlight', 1)
