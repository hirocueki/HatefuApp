use Mojo::Base -strict;

use Test::More;
use Test::Mojo;

use YAML::Syck;
use Hatefu::Model::Feed;


require_ok('Hatefu::Model::Feed');


diag("");
diag("here's what went wrong");
diag("here's what went wrong2");


my $t = Hatefu::Model::Feed->new;

isnt($t, undef);

my $res = $t->entries2();
# my $res = undef;

# isnt($res, undef);
# ok(ref($res) eq "HASH" );

my $itemcount = @$res;
isnt($itemcount, 0);
diag("count = $itemcount");


my $i = @{$res}[0];
diag("LINK = $i->{link}\nUSERS = $i->{users}");

# print @$res


# print Dump $res;

done_testing();

1;
