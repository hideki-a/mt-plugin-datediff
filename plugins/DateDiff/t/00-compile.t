use strict;
use lib qw( t/lib lib extlib );
use warnings;
use MT;
use Test::More tests => 2;
use MT::Test;

ok(MT->component ('DateDiff'), "DateDiff plugin loaded correctry");

require_ok('DateDiff::Tags');

1;
