#!/usr/bin/env perl
use strict;
use warnings;

use Plack::Loader;

my $app = Plack::Util::load_psgi("./hatefu_web.psgi");
Plack::Loader->auto->run($app);
