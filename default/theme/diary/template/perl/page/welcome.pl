#!/usr/bin/perl -T

use strict;
use warnings;

sub GetWelcomePage {
	my $welcomePage =
		GetPageHeader('welcome') .
			GetWriteDialog() .
			GetQueryAsDialog('tags', 'Tags') .
			GetQueryAsDialog('newest', 'Newest') .
			GetPageFooter('welcome');

	if (GetConfig('admin/js/enable')) {
		my @js = qw(avatar puzzle settings profile utils timestamp clock fresh table_sort voting write);
		if (GetConfig('admin/php/enable')) {
			push @js, 'write_php'; # write.html
		}
		$welcomePage = InjectJs($welcomePage, @js)

	}

	return $welcomePage;

}

1;
