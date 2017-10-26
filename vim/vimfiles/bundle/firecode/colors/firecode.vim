" Vim color file
" Converted from Textmate theme FireCode using Coloration v0.4.0 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "firecode"

hi Cursor ctermfg=234 ctermbg=231 cterm=NONE guifg=#191919 guibg=#f8f8f0 gui=NONE
hi Visual ctermfg=NONE ctermbg=239 cterm=NONE guifg=NONE guibg=#515151 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#2f2f2f gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#2f2f2f gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#2f2f2f gui=NONE
hi LineNr ctermfg=102 ctermbg=236 cterm=NONE guifg=#898986 guibg=#2f2f2f gui=NONE
hi VertSplit ctermfg=240 ctermbg=240 cterm=NONE guifg=#5a5a58 guibg=#5a5a58 gui=NONE
hi MatchParen ctermfg=203 ctermbg=NONE cterm=underline guifg=#f63249 guibg=NONE gui=underline
hi StatusLine ctermfg=231 ctermbg=240 cterm=bold guifg=#f8f8f2 guibg=#5a5a58 gui=bold
hi StatusLineNC ctermfg=231 ctermbg=240 cterm=NONE guifg=#f8f8f2 guibg=#5a5a58 gui=NONE
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=239 cterm=NONE guifg=NONE guibg=#515151 gui=NONE
hi IncSearch ctermfg=234 ctermbg=116 cterm=NONE guifg=#191919 guibg=#97d8ea gui=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi Directory ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fc9354 guibg=NONE gui=NONE
hi Folded ctermfg=242 ctermbg=234 cterm=NONE guifg=#6d6d6d guibg=#191919 gui=NONE

hi Normal ctermfg=231 ctermbg=234 cterm=NONE guifg=#f8f8f2 guibg=#191919 gui=NONE
hi Boolean ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fc9354 guibg=NONE gui=NONE
hi Character ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fc9354 guibg=NONE gui=NONE
hi Comment ctermfg=242 ctermbg=NONE cterm=NONE guifg=#6d6d6d guibg=NONE gui=NONE
hi Conditional ctermfg=203 ctermbg=NONE cterm=NONE guifg=#f63249 guibg=NONE gui=NONE
hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Define ctermfg=203 ctermbg=NONE cterm=NONE guifg=#f63249 guibg=NONE gui=NONE
hi DiffAdd ctermfg=231 ctermbg=64 cterm=bold guifg=#f8f8f2 guibg=#43800a gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#880505 guibg=NONE gui=NONE
hi DiffChange ctermfg=231 ctermbg=23 cterm=NONE guifg=#f8f8f2 guibg=#1c3250 gui=NONE
hi DiffText ctermfg=231 ctermbg=24 cterm=bold guifg=#f8f8f2 guibg=#204a87 gui=bold
hi ErrorMsg ctermfg=231 ctermbg=197 cterm=NONE guifg=#f8f8f0 guibg=#f92649 gui=NONE
hi WarningMsg ctermfg=231 ctermbg=197 cterm=NONE guifg=#f8f8f0 guibg=#f92649 gui=NONE
hi Float ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fc9354 guibg=NONE gui=NONE
hi Function ctermfg=32 ctermbg=NONE cterm=NONE guifg=#2e98e2 guibg=NONE gui=NONE
hi Identifier ctermfg=74 ctermbg=NONE cterm=NONE guifg=#73c3d2 guibg=NONE gui=italic
hi Keyword ctermfg=203 ctermbg=NONE cterm=NONE guifg=#f63249 guibg=NONE gui=NONE
hi Label ctermfg=116 ctermbg=NONE cterm=NONE guifg=#97d8ea guibg=NONE gui=NONE
hi NonText ctermfg=59 ctermbg=235 cterm=NONE guifg=#3b3a32 guibg=#242424 gui=NONE
hi Number ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fc9354 guibg=NONE gui=NONE
hi Operator ctermfg=203 ctermbg=NONE cterm=NONE guifg=#f63249 guibg=NONE gui=NONE
hi PreProc ctermfg=203 ctermbg=NONE cterm=NONE guifg=#f63249 guibg=NONE gui=NONE
hi Special ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f8f8f2 guibg=NONE gui=NONE
hi SpecialKey ctermfg=59 ctermbg=236 cterm=NONE guifg=#3b3a32 guibg=#2f2f2f gui=NONE
hi Statement ctermfg=203 ctermbg=NONE cterm=NONE guifg=#f63249 guibg=NONE gui=NONE
hi StorageClass ctermfg=74 ctermbg=NONE cterm=NONE guifg=#73c3d2 guibg=NONE gui=italic
hi String ctermfg=116 ctermbg=NONE cterm=NONE guifg=#97d8ea guibg=NONE gui=NONE
hi Tag ctermfg=203 ctermbg=NONE cterm=NONE guifg=#f63249 guibg=NONE gui=NONE
hi Title ctermfg=231 ctermbg=NONE cterm=bold guifg=#f8f8f2 guibg=NONE gui=bold
hi Todo ctermfg=242 ctermbg=NONE cterm=inverse,bold guifg=#6d6d6d guibg=NONE gui=inverse,bold
hi Type ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=203 ctermbg=NONE cterm=NONE guifg=#f63249 guibg=NONE gui=NONE
hi rubyFunction ctermfg=32 ctermbg=NONE cterm=NONE guifg=#2e98e2 guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fc9354 guibg=NONE gui=NONE
hi rubyConstant ctermfg=116 ctermbg=NONE cterm=NONE guifg=#8ecfdb guibg=NONE gui=italic
hi rubyStringDelimiter ctermfg=116 ctermbg=NONE cterm=NONE guifg=#97d8ea guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fc9354 guibg=NONE gui=italic
hi rubyInstanceVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyInclude ctermfg=203 ctermbg=NONE cterm=NONE guifg=#f63249 guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyRegexp ctermfg=116 ctermbg=NONE cterm=NONE guifg=#97d8ea guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=116 ctermbg=NONE cterm=NONE guifg=#97d8ea guibg=NONE gui=NONE
hi rubyEscape ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fc9354 guibg=NONE gui=NONE
hi rubyControl ctermfg=203 ctermbg=NONE cterm=NONE guifg=#f63249 guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyOperator ctermfg=203 ctermbg=NONE cterm=NONE guifg=#f63249 guibg=NONE gui=NONE
hi rubyException ctermfg=203 ctermbg=NONE cterm=NONE guifg=#f63249 guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=116 ctermbg=NONE cterm=NONE guifg=#8ecfdb guibg=NONE gui=italic
hi rubyRailsARAssociationMethod ctermfg=116 ctermbg=NONE cterm=NONE guifg=#8ecfdb guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=116 ctermbg=NONE cterm=NONE guifg=#8ecfdb guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=116 ctermbg=NONE cterm=NONE guifg=#8ecfdb guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=116 ctermbg=NONE cterm=NONE guifg=#8ecfdb guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=242 ctermbg=NONE cterm=NONE guifg=#6d6d6d guibg=NONE gui=NONE
hi erubyRailsMethod ctermfg=116 ctermbg=NONE cterm=NONE guifg=#8ecfdb guibg=NONE gui=NONE
hi htmlTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlEndTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlTagName ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlArg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fc9354 guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=74 ctermbg=NONE cterm=NONE guifg=#73c3d2 guibg=NONE gui=italic
hi javaScriptRailsFunction ctermfg=116 ctermbg=NONE cterm=NONE guifg=#8ecfdb guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=203 ctermbg=NONE cterm=NONE guifg=#f63249 guibg=NONE gui=NONE
hi yamlAnchor ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlAlias ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=116 ctermbg=NONE cterm=NONE guifg=#97d8ea guibg=NONE gui=NONE
hi cssURL ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fc9354 guibg=NONE gui=italic
hi cssFunctionName ctermfg=228 ctermbg=NONE cterm=NONE guifg=#ffee99 guibg=NONE gui=NONE
hi cssColor ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fc9354 guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=32 ctermbg=NONE cterm=NONE guifg=#2e98e2 guibg=NONE gui=NONE
hi cssClassName ctermfg=32 ctermbg=NONE cterm=NONE guifg=#2e98e2 guibg=NONE gui=NONE
hi cssValueLength ctermfg=209 ctermbg=NONE cterm=NONE guifg=#fc9354 guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=228 ctermbg=NONE cterm=NONE guifg=#ffee99 guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
