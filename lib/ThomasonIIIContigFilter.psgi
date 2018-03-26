use ThomasonIIIContigFilter::ThomasonIIIContigFilterImpl;

use ThomasonIIIContigFilter::ThomasonIIIContigFilterServer;
use Plack::Middleware::CrossOrigin;



my @dispatch;

{
    my $obj = ThomasonIIIContigFilter::ThomasonIIIContigFilterImpl->new;
    push(@dispatch, 'ThomasonIIIContigFilter' => $obj);
}


my $server = ThomasonIIIContigFilter::ThomasonIIIContigFilterServer->new(instance_dispatch => { @dispatch },
				allow_get => 0,
			       );

my $handler = sub { $server->handle_input(@_) };

$handler = Plack::Middleware::CrossOrigin->wrap( $handler, origins => "*", headers => "*");
