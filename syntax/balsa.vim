" Vim syntax file
" Language: Balsa (ft=balsa)
" Maintainer: Shin'ya Ueoka <qeexee@i-beam.org>
" Last Change: version 1.0 (2013-05-31)
" Filetype: balsa

if exists("b:current_syntax")
  finish
endif

syn keyword balsaKeyword    active also and arbitrate array as begin case continue else end enumeration for function halt if in input is let local loop multicast new output over parameter passive print procedure pull push record select shared signed sizeof sync then type val while or xor of

syn match balsaImported display contained "\[[^\]]*\]"
syn match balsaImport display "^\s*import\>\s*\[" contains=balsaImported

syn region balsaComment start='(--' end='--)'
syn region balsaComment start="--" skip="\\$" end="$"

syn keyword balsaTypeName boolean byte nybble nibble sbyte snybble sbibble cardinal long
syn keyword balsaTypeModifier array channel variable bits constant 
syn keyword balsaConstant true false

syn match balsaNumbers display transparent "\<\d" contains=balsaNumber,balsaOctalError,balsaOctal
syn match balsaNumbersCom display contained transparent "\<\d" contains=balsaNumber,balsaOctal
syn match balsaNumber display contained "\d\+\>"
syn match balsaNumber display contained  "0x\x\+\>"
syn match balsaNumber display contained  "0b[01]\+\>"
syn match balsaOctal display "0\o\+\>" contains=balsaOctalZero
syn match balsaOctalZero display contained "\<0"
syn match balsaOctalError display contained "0\o*[89]\d*"

syn region balsaString start=+"+  skip=+\\\\\|\\"+  end=+"\|$+

"syn match balsaOperator "[\[\]]"
"syn match balsaOperator "[.#\[\]\^\*/%\+\-\@\<\>=:]"
"syn match balsaOperator ":=\|<-\|->"
syn match balsaBitAccess "#"
syn match balsaFlowControl "||\|;"

hi def link balsaKeyword Keyword
hi def link balsaImport Include
hi def link balsaImported String
hi def link balsaComment Comment
hi def link balsaTypeName Identifier
hi def link balsaTypeModifier Type
hi def link balsaConstant Constant
hi def link balsaNumber Number
hi def link balsaOctal Number
hi def link balsaOctalZero PreProc
hi def link balsaOctalError Error
hi def link balsaBitAccess Special
hi def link balsaFlowControl Special

"hi def link balsaNormal Normal

let b:current_syntax = "balsa"

