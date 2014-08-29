package Hatefu::Model::Feed;
use utf8;
use Mouse v2.3.0;
use Hatefu;
use LWP::UserAgent 6.06;
use Web::Scraper 0.37;


sub entries{

  my ($self, $param) = @_;

  my $link = 'http://b.hatena.ne.jp/search/tag?safe=on&q='.$param->{keyword}.'&users='.$param->{threshold};

  my $uri = URI->new($link);


  my $hatefu_inner = scraper {
      process 'h3 > a', title => 'TEXT',
      process 'h3 > a', url => '@href',
      process 'span > strong > a > span', users => 'TEXT'
  };

  my $hatefu = scraper {
    process '#search-result-lists > ul > li', 'results[]' => $hatefu_inner;
    result 'results';
  };

  my $entries = $hatefu->scrape($uri);

  $entries;
}

__PACKAGE__->meta->make_immutable();
