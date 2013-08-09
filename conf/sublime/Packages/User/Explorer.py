import os, sublime, sublime_plugin

class ExplorerCommand(sublime_plugin.TextCommand):
   def run(self, edit):
      f = self.view.file_name();
      #exe = sublime.packagesPath()
      #exe = os.path.join(exe, "User")
      #exe = os.path.join(exe, "MyParser.exe")
      exe = "c:\\windows\\explorer.exe"
      cmd = 'cmd /c start "ignored" "%(exe)s" /select,"%(args)s"' % {'exe' : exe, 'args' : f } # stderr > out.txt 2>&1
      result = os.system(cmd)
