package Hatefu::Web::Controller::Root;

use Mojo::Base 'Mojolicious::Controller';
use Test::More;
use FindBin;
use lib "$FindBin::Bin/lib";
use Hatefu::Model::Feed;
use FormValidator::Lite;


sub index {
  my $self = shift;

  $self->render( msg => 'ハテフ(Hatena Bookmark Filter)', entries => undef );
}

sub result{
  my $self = shift;

  # ホームオブジェクトの取得
  my $model = Hatefu::Model::Feed->new;
  ok $model;

  my %param = (
    keyword => $self->param('keyword'),
    threshold => $self->param('threshold')
    );

  my $entries = $model->entries(\%param);

  $self->stash->{entries} = $entries;

  $self->render( msg => 'ハテフ(Hatena Bookmark Filter)' );

}

1;
