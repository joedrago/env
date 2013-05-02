" Nova project settings

setlocal noet
set sw=4
set ts=4
set sts=4

execute 'setlocal formatprg=astyle\ --options=' . expand('<sfile>:p:h') . '/../../../conf/astyle/nova.txt'
