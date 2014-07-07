package Hatefu::Web::Controller::Root;

use Mojo::Base 'Mojolicious::Controller';
use Test::More;
use FindBin;
use lib "$FindBin::Bin/lib";
use Hatefu::Model::Feed;

# This action will render a template
sub index {
  my $self = shift;

  # ホームオブジェクトの取得
  my $model = Hatefu::Model::Feed->new;
  ok $model;

  my %param = (keyword => 'Perl', threshold => 200);
  my $entries = $model->entries(\%param);

  # my $e;
  # $e->{url} = 'http://example';
  # $e->{users}=100;
  #
  # my @entries = ($e);
  # # push @entries $e;
  #
  # my $entries = \@entries;

  $self->stash->{entries} = $entries;

  $self->render( msg => 'ハテフ(Hatena Bookmark Filter)' );

}

1;
