package XML::XSPF::Base;

# $Id: /mirror/sdi-opensource/XML-XSPF/lib/XML/XSPF/Base.pm 12537 2006-05-04T18:06:09.214291Z dsully  $

use strict;
use base qw(Class::Accessor);

sub _getSetWithDefaults {
	my $self     = shift;
	my $key      = shift;
	my $defaults = shift;

	if (@_) {
		$self->set($key, @_);
	}

	# Set the default version to 1 if it's not set.
	my $value = $self->get($key);

	if (!defined $value) {
		$value = $defaults->{$key};
	}

	return $value;
}

sub _asArray {
	my $self = shift;
	my $key  = shift;

	if (@_) {

		if (ref($_[0]) eq 'ARRAY') {

			$self->set($key, @_);

		} else {

			$self->set($key, [ @_ ]);
		}
	}

	my $array = $self->get($key);

	if (ref($array) eq 'ARRAY') {

		return @{$array};

	} else {

		return ();
	}
}

sub append {
	my $self = shift;
	my $key  = shift;

	push @{ $self->get($key) }, @_;
}

1;

__END__
