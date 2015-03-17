use v6;
use Test;

plan 3;

use HTTP::ParseParams;

my %data = HTTP::ParseParams::parse("a=b&c=d", :urlencoded);

ok %data, 'parsed query string';
is %data<a>, 'b', 'got first param';
is %data<c>, 'd', 'got second param';
