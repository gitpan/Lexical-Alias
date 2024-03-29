package Lexical::Alias;

use 5.008_001;
use strict;
#use warnings;

our $VERSION = '0.01';

use XSLoader;
XSLoader::load(__PACKAGE__, $VERSION);

1;
__END__

=head1 NAME

Lexical::Alias - Perl extention to declare lexical aliases

=head1 VERSION

This document describes Lexical::Alias version 0.01.

=head1 SYNOPSIS

	use Lexical::Alias;

	sub inc{
		my alias $x = shift;
		$x++;
		return;
	}

	my $i = 0;
	inc($i);
	print $i, "\n"; # => 1

=head1 DESCRIPTION

Lexical::Alias allows you to declare lexical aliases, re-using C<typed lexical> syntax.

=head1 GUTS

This module uses a custome peephole optimizer to change compiled syntax trees.

See also L<perlguts/"Custome Operators">.

=head1 DEPENDENCIES

Perl 5.8.1 or later, and a C compiler.

=head1 BUGS

No bugs have been reported.

Please report any bugs or feature requests to the author.

=head1 SEE ALSO

L<Lexical::Types>.

L<perltodo/"lexical aliases">.

=head1 AUTHOR

Goro Fuji (gfx) E<lt>gfuji(at)cpan.orgE<gt>.

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2009, Goro Fuji (gfx). Some rights reserved.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
