use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/lib";
use Mojo::Server::PSGI;
use Plack::Builder;
use Hatefu::Web;

my $psgi = Mojo::Server::PSGI->new(app => Hatefu::Web->new);
my $app = $psgi->to_psgi_app;

builder {
    # ここでPlack::Middleware::*を使う記述をする
    $app;
};
