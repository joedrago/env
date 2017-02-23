@echo off
REM git log --oneline --graph --decorate --pretty=format:"%%C(yellow)%%h%%Creset -%%C(bold red)%%d%%Creset %%s %%C(blue)(%%cr) %%C(bold green)<%%an>%%Creset" --abbrev-commit --date-order %*
git log --oneline --graph --decorate --pretty=format:"%%C(auto)%%h %%C(reset)| %%s%%C(reset)%%C(auto)%%d %%C(reset)| %%C(green)%%cr %%C(reset)| %%C(cyan)%%an" --abbrev-commit --date-order %*
