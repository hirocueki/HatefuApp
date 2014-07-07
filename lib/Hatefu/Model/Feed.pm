package Hatefu::Model::Feed;
use utf8;
use Mouse v2.3.0;
use Hatefu;
use LWP::UserAgent 6.06;
use XML::RSS::Parser 4.0;

sub entries {
  my ($self, $param) = @_;

  # '東芝'、はてブ数20以上、人気順で検索したRSS結果
  # http://b.hatena.ne.jp/keyword/%E6%9D%B1%E8%8A%9D?sort=popular&threshold=20&mode=rss
  my $uri = "http://b.hatena.ne.jp/keyword/".$param->{keyword}."?sort=popular&threshold=".$param->{threshold}."&mode=rss";

  my $ua = LWP::UserAgent->new;
  my $response = $ua->get($uri);

  unless ($response->is_success) {
    die $response->status_line;
  }

  my $rss = XML::RSS::Parser->new;

	my $feed = $rss->parse_string($response->decoded_content);


  my @entries = ();
	##	フィードアイテムを収集
	foreach ( $feed->query('//item') ) {
    my $item;
    $item->{title} = $_->query('title')->text_content;
    $item->{url} = $_->query('link')->text_content;
    $item->{users} = 99;#$_->query('hatena:bookmarkcount')->text_content;

    push @entries, $item;

  }

  \@entries;
}

__PACKAGE__->meta->make_immutable();
