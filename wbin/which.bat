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

use strict;
use Cwd;

my $cmdName = shift(@ARGV);
unless($cmdName)
{
    print("Syntax: which [command name]\n");
    exit(-1);
}

my @PATHEXT = split(/;/, $ENV{'PATHEXT'});
my @PATH = split(/;/, $ENV{'PATH'});
unshift(@PATH, getcwd());

unless(scalar(@PATHEXT))
{
    @PATHEXT = qw/com exe bat cmd/;
}

my $hasExtension = 0;
if($cmdName =~ /\./)
{
    # extension already provided
    $hasExtension = 1;
}

for my $path (@PATH)
{
    my $exe = "$path\\$cmdName";
    $exe =~ s/\\\\/\\/g;
    if($hasExtension)
    {
        if(-x $exe)
        {
            print("$exe\n");
            exit(0);
        }
    }
    else
    {
        for my $ext (@PATHEXT)
        {
            my $exePlusExt = lc("$exe$ext");
            #print("checking $exePlusExt\n");
            if(-x $exePlusExt)
            {
                print("$exePlusExt\n");
                exit(0);
            }
        }
    }
}

__END__
:endofperl
