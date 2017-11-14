################################
#                              #
# Coded By |~/M7md             #
#                              #
# Telegram | cydia4            #
#                              #
#                              #
#                              #
################################
use LWP::UserAgent;
system('cls');
system('color 1e');
print '
################################
#                              #
# Coded By |~/M7md             #
#                              #
# Telegram | cydia4            #
#                              #
# Twitter Checker              #
#                              #
################################
';
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
	open(R0T,">>Taken.txt");
	print R0T "$U\n";
	close(R0T);
	
}
else {
	print "Not Taken ($U)\n";
}}
