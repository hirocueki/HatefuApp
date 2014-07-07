package Hatefu::Web;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer');

  # Router
  my $r = $self->routes;

  # '東芝'、はてブ数20以上、人気順で検索したRSS結果
  # http://b.hatena.ne.jp/keyword/%E6%9D%B1%E8%8A%9D?sort=popular&threshold=20&mode=rss
  $r->namespaces([qw/Hatefu::Web::Controller/]);
  $r->get('/')->to('root#index');
  $r->post('/')->to('root#index');
}

1;
