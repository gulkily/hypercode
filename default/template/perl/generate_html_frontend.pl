#!/usr/bin/perl -T
#freebsd: #!/usr/local/bin/perl -T

use strict;
use warnings;
use 5.010;
use utf8;

require('./utils.pl');
MakeSummaryPages(); # generate_html_frontend.pl
BuildTouchedPages(); # generate_html_frontend.pl

1;
