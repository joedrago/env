@echo off

ctags -R -f .tags --exclude=boost --extra=+q --fields=+Kain --c++-kinds=+p --c-kinds=+p

