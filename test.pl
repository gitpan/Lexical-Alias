# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test;
use Devel::Peek;
BEGIN { plan tests => 16 };
use Lexical::Alias qw( alias_r );
ok(1); # If we made it this far, we're ok.

#########################

# Insert your test code below, the Test module is use()ed here so read
# its man page ( perldoc Test ) for help writing this test script.

my ($x, $y);
alias_r(\$x, \$y);

$x = 10;
ok($x == 10);
ok($y == 10);

$y = 20;
ok($x == 20);
ok($y == 20);

ok(\$x == \$y);


$z = 100;
alias_r(\$z, \$y);

$z = 10;
ok($z == 10);
ok($y == 10);
ok($x == 10);

$y = 20;
ok($z == 20);
ok($y == 20);
ok($x == 20);

$x = 30;
ok($z == 30);
ok($y == 30);
ok($x == 30);

ok(\$z == \$y and \$y == \$x);

my @w;
ok( ! eval { alias_r(\@w, \$z); 1 } );
ok( $@ =~ /same type/i );

ok( ! eval { alias_r(\@w, $z); 1 } );
ok( $@ =~ /must be ref/i );

ok( ! eval { alias_r($y, \$z); 1 } );
ok( $@ =~ /must be ref/i );
