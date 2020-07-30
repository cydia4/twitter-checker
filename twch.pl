use LWP::UserAgent;
system('cls');
system('color 1e');
print qq(
Enter user File:
> );
$userr=<STDIN>;
chomp($userr);
open (EMAILFILE, "<$userr") || die "[-] Can't Open The List Of User  !";
@USERS = <EMAILFILE>;
close EMAILFILE;
foreach $U (@USERS) {
chomp $U;
my $ua = LWP::UserAgent->new;
my $url = "https://api.twitter.com/i/users/username_available.json?context=signup&custom=1&full_name=Mohammad&send_error_codes=1&suggest=1&username=$U";
my $req = HTTP::Request->new(GET => $url);
my $resp = $ua->request($req);
if ($resp->content=~ /false/) {
	print "==========================================
		Taken ($U)
==========================================\n";
	open(FORFUN,">>Taken.txt");
	print FORFUN "$U\n";
	close(FORFUN);
	
}
else {
	print "Not Taken ($U)\n";
}}
