package KiokuDB::Backend::Serialize::Delegate;
use Moose::Role;
# ABSTRACT: Use a KiokuDB::Serializer object instead of a role to handle serialization in a backend.

use KiokuDB::Serializer;

use namespace::clean -except => 'meta';

#with qw(KiokuDB::Backend::Serialize);

has serializer => (
    does    => "KiokuDB::Backend::Serialize",
    is      => "ro",
    coerce  => 1,
    default => "storable",
    handles => [qw(serialize deserialize)],
);

__PACKAGE__

__END__

=pod

=head1 SYNOPSIS

    package MyBackend;
    use Moose;

    with qw(
        ...
        KiokuDB::Backend::Serialize::Delegate
    );



    MyBackend->new(
        serializer => "yaml",
    );

=head1 DESCRIPTION

This role provides a C<serialzier> attribute (by default
L<KiokuDB::Serializer::Storable>) with coercions from a moniker string for easy
serialization format selection.

=cut
