#!/usr/bin/perl


use Socket;
use Term::ANSIColor;
use WWW::Mechanize;
use JSON;

print color 'reset';
@iphost=$ARGV[0] || die "Usage: ./Tracer.pl [host] or [ip] or [domain]";
my @ip = inet_ntoa(scalar gethostbyname("@iphost")or die "IP or Host invalid!\n");
my @hn = scalar gethostbyaddr(inet_aton(@ip),AF_INET);
 
my $GET=WWW::Mechanize->new();
    $GET->get("http://ip-api.com/json/@ip"); 
    my $json = $GET->content();
	#------------------------------------------------------------------------------
my $info = decode_json($json);
print "  [!] IP: ", $info->{'query'}, "\n";
print "------------------------------------\n"; 
print "  # ORG: ", $info->{'as'}, "\n";
print "  # ISP: ", $info->{'isp'}, "\n";
print "  # Geo: ", "Lat: " , $info->{'lat'}, " - Long: ", $info->{'lon'}, "\n";
print "  # Geo: ", "Latitude: " , $info->{'lat'}, " - Long: ", $info->{'lat'}, "\n";
print "  # Time: ", "timezone: " , $info->{'timezone'}, " - Long: ", $info->{'timezone'}, "\n";
print "  # As number/name: ", "as: " , $info->{'as'}, " - Long: ", $info->{'as'}, "\n";
print "  # Country: ", $info->{'country'}," - ", $info->{'countryCode'}, "\n";
print "  # City: ", $info->{'city'}, "\n";
print "  # Region: ", $info->{'regionName'}, " - " , $info->{'region'}, "\n";
print "  # ORG: ", $info->{'as'}, "\n";
print "  # Country code: ", $info->{'countryCode'}, "\n"; 
print "  # Status: ", $info->{'status'}, "\n"; 
print "\n";
