@echo off
@reg add "HKEY_CLASSES_ROOT\*\shell\Open with Sublime Text" /t REG_SZ /v "" /d "Open with Sublime Text"   /f
@reg add "HKEY_CLASSES_ROOT\*\shell\Open with Sublime Text" /t REG_EXPAND_SZ /v "Icon" /d "%~dp0sublime_text.exe,0" /f
@reg add "HKEY_CLASSES_ROOT\*\shell\Open with Sublime Text\command" /t REG_SZ /v "" /d "\"%~dp0sublime_text.exe\" \"%%1\"" /f
pause
