#!/usr/bin/perl

# test for missing libraries and try to fill them in from default

$result = system("perl -e 'use lib qw(lib); use URI::Encode;'");
if ($result) {
    # problem including URI::Encode

    # there are three possible solutions to this problem:

    # 1) we can try to use regular CPAN to install the library
    # challenge: for this, it is easier if we use sudo

    # 2) we can try to fill the library in from default (copy we brought along with us in the repo)
    # challenge: it may be the wrong version

    # 3) we may just need to remove the library from lib/ if a version conflict is causing the problem
    # challenge: how to detect this?

    { #2
        # if the library is missing, we can try to fill it in from the one we brought with us in the repo:
        system("mkdir lib; mkdir lib/URI; cp default/template/perl/lib/URI/Encode.pm lib/URI/Encode.pm");
    }
} else {
    # 0 means it is ok
}

#$result = system("perl -e 'use lib qw(lib); use URI::Escape;'");

#print $result;