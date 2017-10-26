use strict;

# Change these
my $TEMPDIR = $ENV{'USERPROFILE'};
my $OUTDIR = "c:/work/webroot/diffs";

sub main
{
    my $reportName = $ENV{'REPORTNAME'};
    my $localDir = shift(@ARGV);
    my $remoteDir = shift(@ARGV);

    unless($reportName and $localDir and $remoteDir) {
        print "Report requires a name.\n";
        exit();
    }

    my $scriptFilename = "$TEMPDIR/script.txt";
    $scriptFilename =~ s/\//\\/g;
    $scriptFilename =~ s/\\\\//g;

    my $lcReportName = $reportName;
    $lcReportName =~ s/[\t ]+/_/g;
    $lcReportName =~ s/[^-A-Za-z0-9_]//g;
    $lcReportName = lc($lcReportName);
    my $reportDir = $OUTDIR . "/$lcReportName";
    rename($reportDir, "$reportDir.old");
    mkdir($reportDir);
    my $reportFilename = "$reportDir/index.html";
    $reportFilename =~ s/\//\\/g;
    $reportFilename =~ s/\\\\//g;

    print "reportName '$reportName' localDir '$localDir' remoteDir '$remoteDir'\n";
    print "script $scriptFilename\n";

    my $fh;
    open($fh, '>', $scriptFilename) or die "cannot write to $scriptFilename";
    print $fh "load \"$localDir\" \"$remoteDir\"\n";
    print $fh "expand all\n";
    print $fh "folder-report layout:side-by-side options:include-file-links title:\"$reportName\" output-to:\"$reportFilename\" output-options:wrap-none,html-color";
    close($fh);

    system("\"c:/Program Files/Beyond Compare 4/bcompare.exe\" \"\@${scriptFilename}\"");

    my $url = sprintf("http://%s/diffs/$lcReportName/", getIP());
    system("start $url");
}

sub getIP
{
    my @ifconfig = map { chomp; $_ } `ipconfig`;
    for my $line (@ifconfig) {
        if($line =~ /IPv4 Address.+:\s+(\d+\.\d+\.\d+\.\d+)/) {
            my $ip = $1;
            return $ip;
        }
    }
    return "unknownIP";
}

main();
