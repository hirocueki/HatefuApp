requires 'Config::PL', '0.02';
requires 'LWP::UserAgent', '6.06';
requires 'Mojo::Base';
requires 'Mojo::Server::PSGI';
requires 'Mojolicious::Commands';
requires 'Mouse', 'v2.3.0';
requires 'Plack::Builder';
requires 'Test::More';
requires 'XML::RSS::Parser', '4.0';
requires 'FormValidator::Lite', '0.37';
on test => sub {
    requires 'Test::Mojo';
};
