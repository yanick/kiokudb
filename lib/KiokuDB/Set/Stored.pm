package KiokuDB::Set::Stored;
use Moose;
# ABSTRACT: Stored representation of KiokuDB::Set objects.

use namespace::clean -except => 'meta';

extends qw(KiokuDB::Set::Base);

has _objects => ( is => "ro" );

__PACKAGE__->meta->make_immutable;

__PACKAGE__

__END__

=pod

=head1 SYNOPSIS

    # used internally by L<KiokuDB::TypeMap::Entry::Set>

=head1 DESCRIPTION

This object is the persisted representation of all L<KiokuDB::Set> objects.

It is used internally after collapsing and before expanding, for simplicity.

=cut
