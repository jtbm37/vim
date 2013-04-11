" Vim syntax file
" Language: Log4net
" Maintainer: Jean TBM
" Latest Revision: 11 April 2013

if exists("b:current_syntax")
    finish
endif


syn match   messagesBegin       display '^' nextgroup=messagesDate
syn match   messagesDate        contained display '\d\{4}-\d\d-\d\d *' 
            \ nextgroup=messagesHour 
syn match   messagesHour        contained display '\d\d:\d\d:\d\d,\d\d\d\s*' 
            \ nextgroup=messagesThreadId
syn match   messagesThreadId    contained display '\[\d*\]\s*'
            \ nextgroup=messagesLevel,messagesLevelError
syn match   messagesLevel       contained display '\(INFO\|DEBUG\)\s*' 
            \ nextgroup=messagesContext
syn match   messagesLevelError       contained display '\(FATAL\|ERROR\)\s*' 
            \ nextgroup=messagesContext
syn match   messagesContext     contained display '[a-zA-Z.]*\s'
            \ nextgroup=messagesLoc
syn match   messagesLoc     contained display '\[.*\] '
            \ nextgroup=messagesText
syn match   messagesText        contained display '\-.*'
            "\ contains=messagesLevelError
syn region   messagesTextError  start=/\-\s/ end=/$/  matchgroup=messagesLevelError
            "\ contains=messagesLevelError


" hi def link logLevel Constant
hi def link messagesDate Type
hi def link messagesHour Type
hi def link messagesThreadId Identifier 
hi def link messagesLevel Normal
hi def link messagesLevelError ErrorMsg
hi def link messagesText ErrorMsg 
"hi def link messagesTextError ErrorMsg
hi def link messagesContext Normal
hi def link messagesLoc Constant
hi def link messagesTextError Type

let b:current_syntax = 'log4net'
