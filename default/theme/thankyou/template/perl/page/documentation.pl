#!/usr/bin/perl -T

use strict;
use warnings;
use 5.010;

sub GetReadmeDialog {
	my $text = "
thankyou is a framework for building community websites
with an emphasis on consent and accessibility.

CONSENT:

For operators and administrators, RocketScience supports every released software
version indefinitely, forgoing forced updates or any coersion.

For users and clients, RocketScience facilitates full account and data ownership
and accessibility. Users should be able to access or not access the service as
they see fit and in whatever way they see fit, as long as it is with the consent
of the operator. Users should be able to see, with full transparency, all the
data and information contained in the service.

ACCESSIBILITY:

RocketScience bends over backwards to accommodate every user and client,
regardless of their access method of choice, browser and configuration,
connection speed, device type, abilities, and situation.

RocketScience tries to perpetuate the Any Browser philosophy, and is regularly
tested with a variety of browsers and configurations. In particular, RocketScience
has been tested with popular versions of Lynx, Mosaic, Netscape, Internet Explorer,
Opera, Firefox, Brave, Safari, and even Google Chrome.

WHY USE THIS?
=============
Below is an outline of reasons you would want to use RocketScience.

Empowering:
User account, aka private key, remains in user's possession and control.
Identity can be used across multiple servers without federation.
Registration is not required, and registering does not require email.
Designed to allow the user to know who is operating the site.
Users can easily export their own contributions in comfortable formats.

Provable:
Provable reliability of information integrity with digital signatures.
Provable consensus and voting results -- full transparency.
Provable privacy by allowing end user to control physical access to data.

Portable:
All forum text is stored as text files, improving ability to archive.
Data is housed by service provider without lock-down and is always exportable.

Customizable:
Custom themes and appearance using simple commands (like Myspace or Tumblr)

Durable/Decentralized:
All data can be downloaded and replicated, in entirety or in segments.
Can be cloned and re-hosted, with portable user accounts usable across all copies.

Accessible:
Tries very hard to accommodate every known and testable client.
Tested with hundreds of different browsers, devices, and configurations.
Full support for text-mode, no-JS, screen-readers, mouse-free, etc.
Allows registration to be optional, if operator wants to allow it.
Easier to access via telnet or text-mode than most websites.
Attempts universal accessibility for all anticipated scenarios.

Securable:
Can be operated as static HTML for a smaller attack surface.
JavaScript is also an optional module and optional for clients.

Convenient Installation:
Uses the most stable technologies, and compatible with most Web servers
Optional PHP and SSI modules for more convenient usage.
Optional client-side JS module for easier client signatures.

Friendly, Compatible, Accessible:
Modular interface shows only the basics for beginners, more options later.
Tested thoroughly by many devices, configurations, platforms, browsers, users.
Tested for accessibility by vision, mobility, and connectivity impaired users.
Tested with Mosaic, Netscape, IE, Opera, iOS, Android, Lynx, w3m, and more.
Supports all web servers which can write standard access.log format.

Art-Friendly:
Text-art is accommodated with a monospace font and preserving whitespace layout.
Compatible with historic browsers to allow time-period-accurate installations.

Transparent:
Everything posted to community is viewable and verifiable.
Voting logs are transparent, auditable, and trustable (Kevin Bacon)
Meta-moderation is possible by voting on votes, and so on.
Best content (and friends) for each user can be found with vote comparison.
Ballot stuffing and other abuse is detectable with data analysis.
Validation chain prevents tampering with item posting timestamps.
Items can be deleted by operator, but trace remains in timestamp log.

Resilient:
Avoid being a spam target by fine-tuning access.
Avoid advertising by avoiding community over-growth.
User-centric operation allows easy migration in case of instance changes.
";
	my $textArt = str_replace("\n", " <br>\n", $text);
	my $textArtDialog = GetDialogX($textArt, "README");

} # GetReadmeDialog()

sub GetDocumentationPage {
	my $html =
		GetPageHeader('documentation') .
		GetDialogX(GetTemplate('html/page/documentation.template'), 'Documentation') .
		GetReadmeDialog() .
		GetPageFooter('documentation')
	;
	if (GetConfig('admin/js/enable')) {
		my @js = qw(utils);
		$html = InjectJs($html, @js)
	}

	return $html;
} # GetDocumentationPage()

1;
