" --------------------------------------------------------------
" --------------- Tab/Spaces Settings --------------------------
" --------------------------------------------------------------
set expandtab       " tabs are spaces
set tabstop=4       " number of visual spaces per TAB
set shiftwidth=4    " number of inserted for indentation
set softtabstop=4   " number of spaces in tab when editing


" --------------------------------------------------------------
" ------------------ Editor Settings ---------------------------
" --------------------------------------------------------------
set number          " show line numbers
"set showcmd        " show command in bottom bar
"set cursorline      " hightlight current line
"set wildmenu       " visual autocomplete for command menu
set showmatch       " hightlight matching [{()}]

au BufNewFile,BufRead /*.rasi setf css
