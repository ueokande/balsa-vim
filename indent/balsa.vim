" Vim indent file
" Language: Balsa (ft=balsa)
" Maintainer: Shin'ya Ueoka <qeexee@i-beam.org>
" Last Change: version 1.0 (2013-05-31)
" Filetype: balsa

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetBalsaIndent()
setlocal indentkeys+=0=begin,0=end,0=is,0=then,0=else,0=end,|
setlocal nosmartindent

if exists("*GetBalsaIndent")
  finish
endif

function! GetBalsaIndent()
  let lnum = prevnonblank(v:lnum - 1)
  if lnum == 0
    return 0
  endif

  let pnum = prevnonblank(lnum - 1)
  let pline = getline(lnum)
  let cline = getline(v:lnum)
  let ind = indent(lnum)

  if pline =~ '^\s*procedure' && pline !~ '\<is\>\s*$'
    let ind += &sw + &sw
  elseif pline =~ '\<is\>\s*$'
    let ind = s:procedure_indent(v:lnum) + &sw
  elseif (pline =~ '^\s*\<\%(begin\|loop\|local\|for\|if\|case\|else\)\>' ||
          \ pline =~ '^\s*|' ||
          \ pline =~ '\<then\)\>\s*$') &&
          \ pline !~ '\<end\>\s*\%(#.*\)\=$'
    let ind += &sw
  endif

  if cline =~ '^\s*end.*$'
    let ind -= &sw
  elseif cline =~ '^\s*\%(begin\|then\|else\|of\)\>.*$' || cline =~ '^\s*|.*$'
    let ind -= &sw
  elseif cline =~ '^\s*\<is\>'
    let ind = s:procedure_indent(lnum)
  endif

  return ind
endfunction

function! s:procedure_indent(num)
  let num = a:num
  while 0 <= num
    if getline(num) =~ '^\s*\<procedure\>'
      return indent(num)
    endif
    let num -= 1
  end
  return 0
endfunction

function! s:if_case_indent(num)
  let num = a:num
  while 0 <= num
    let line = getline(num)
    if line =~ '^\s*\<\%(if\|case\)\>'
      return indent(num)
    endif
    let num -= 1
  end
  return 40
endfunction
