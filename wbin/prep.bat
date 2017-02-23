@rem = '--*-Perl-*--
@echo off
if "%OS%" == "Windows_NT" goto WinNT
perl -x -S "%0" %1 %2 %3 %4 %5 %6 %7 %8 %9
goto endofperl
:WinNT
perl -x -S %0 %*
if NOT "%COMSPEC%" == "%SystemRoot%\system32\cmd.exe" goto endofperl
if %errorlevel% == 9009 echo You do not have Perl in your PATH.
if errorlevel 1 goto script_failed_so_exit_with_non_zero_val 2>nul
goto endofperl
@rem ';
#!perl
#line 15

$|=1;

use strict;
use Data::Dumper;
use Cwd;

my $cwd = getcwd();
print "Building list of files...\n";
my $dh;
opendir($dh, $cwd) or die;
my @paths = grep { !/^(?:\.|build_)/ } readdir($dh);
closedir($dh);

my @cscopeList;

for my $path (@paths)
{
    my $fullPath = "$cwd/$path";
    $fullPath =~ s/\//\\/g;
    if(-f $fullPath)
    {
        push(@cscopeList, $fullPath);
    }
    else
    {
        print "Walking $fullPath...\n";
        my @l = grep {
            if(/boost/)
            {
                0;
            }
            elsif(!/\.(?:h|cpp|c)$/)
            {
                0;
            }
            else
            {
                1;
            }
        } map { chomp; $_ } `dir /s /b /A:-D $fullPath`;
        push(@cscopeList, @l);
    }
}
print "Found " . scalar(@cscopeList) . " files.\n";

my $th;
open($th, '>', "$cwd/cscope.files") or die "cant open cscope.tmp";
for my $p (@cscopeList)
{
    print $th "\"$p\"\n";
}
close($th);

print "Running cscope...\n";
system("cscope -b");

__END__
:endofperl
