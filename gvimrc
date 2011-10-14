if has("gui_macvim")
   " COMMAND T:
   macmenu &File.New\ Tab key=<nop>
   macmenu &File.Open\ Tab\.\.\. key=<nop>
   map <D-t> :CommandT<CR>
   map <D-T> :CommandTBuffer<CR>

   " ACK: 
   macmenu Window.Toggle\ Full\ Screen\ Mode key=<nop>
   macmenu &Edit.Find.Find\.\.\. key=<nop>
   map <D-f> :Ack<space>

   " CONQUETERM:
   map <D-e> :call StartTerm()<CR>
endif

" ConqueTerm wrapper
function StartTerm()
  execute 'ConqueTerm ' . $SHELL . ' --login '
  setlocal listchars=tab:\ \ 
endfunction

