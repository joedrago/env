" Metroid project settings

execute 'setlocal formatprg=astyle\ --options=' . expand('<sfile>:p:h') . '/../../../conf/astyle/metroid.txt'
