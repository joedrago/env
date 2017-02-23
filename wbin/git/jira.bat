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
use Win32::Clipboard;

my $commit = shift(@ARGV) // 'HEAD';
my $isNRDP = shift(@ARGV) // undef;

print "generating Jira comment from $commit\n\n";

my @lines = map { chomp; $_ } `git show $commit`;

# use Data::Dumper;
# print Dumper(\@lines);

my $sha = '';
my $log = '';
for my $line (@lines)
{
    if($line =~ /^commit (\S+)/)
    {
        $sha = $1;
    }
    elsif($line =~ /^diff/)
    {
        last;
    }
    elsif($line =~ /^(?:\s+|$)/)
    {
        $log .= "$line\n";
    }
}

unless($sha && $log)
{
    die "can't find sha and/or log";
}

my $short = substr($sha, 0, 11);

$log =~ s/^[\n\r]+//s;
$log =~ s/[\n\r]+$//s;
$log =~ s/^    //gm;
#$log =~ s/\[/\\[/g;
#$log =~ s/\]/\\]/g;

my $project = 'NOVA';
my $repo = 'nova';
if(defined($isNRDP)) {
    $project = 'NRDP';
    $repo = 'nrdp';
}

my $clipboard = <<EOF;
Commit [$short|https://stash.corp.netflix.com/projects/$project/repos/$repo/commits/$sha]
{code}
$log
{code}
EOF


print "---\n$clipboard---\n";

my $CLIP = Win32::Clipboard();
$CLIP->Set($clipboard);

print " => copied to clipboard\n";

__END__
:endofperl
