if exists("b:current_syntax")
    finish
endif

"Three ways to match: keyword, match & region
"Number/Boolean/Float
syntax match actNumber "\v(\h|\.)@<!\zs(\d*\.?\d{1,}[eE])\ze([^0-9a-zA-Z_.]{-1,}|$)"
syntax match actNumber "\v(\h|\.)@<!\zs(\d{1,}\.?\d*)\ze([^0-9a-zA-Z_.]{-1,}|$)"
syntax keyword actConstant true false

"Function/Variable
"syntax match actFunction

"Statement
syntax keyword actStatement else skip

"Operator
syntax match actOperator display "\M+\|-\|*\|/\|>\|<\|&\|~\||\|!\|?"
syntax match actOperator display "\M:=\|->"
syntax match actOperator display "\M<=\|=>"
syntax match actOperator display "\M<<\|>>"

"PreProc
syn region	actIncluded	display contained start=+"+ skip=+\\\\\|\\"+ end=+"+
syn match	actIncluded	display contained "<[^>]*>"
syn match	actInclude	display "^\s*import\>\s*["<]" contains=actIncluded

"Type
syntax keyword actType pint pbool pstring bool

"Structure
syntax keyword actStructure defproc prs hse chp

"Delimiter
syntax match actDelimiter display "\v\(|\)|\[|\]|\{|\}|\;|\*\[|,"

"String/Character
"for now, support only "" for string
"syntax match actString display "\v\'.*\'"
syntax match actString display "\v\".*\""

"Comment
syntax match actComment "\v\/\/.*" contains=actTodo
syntax region actComment start="\v\/\*" end="\v\*\/" contains=actTodo
syntax keyword actTodo  contained TODO FIXME

"Highlight
highlight link actString String
highlight link actNumber Number
highlight link actConstant Constant
highlight link actStatement Statement
highlight link actOperator Operator
highlight link actIncluded actString
highlight link actInclude Include
highlight link actType Type
highlight link actStructure Structure
highlight link actDelimiter Delimiter
highlight link actComment Comment
highlight link actTodo Todo

let b:current_syntax = "act"
