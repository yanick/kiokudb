package KiokuDB::Role::Immutable::Transitive;
use Moose::Role;
# ABSTRACT: A role for immutable objects that only point at other such objects.

use namespace::clean -except => 'meta';

with qw(
    KiokuDB::Role::Immutable
    KiokuDB::Role::Cacheable
);


# ex: set sw=4 et:

__PACKAGE__

__END__

=pod

=head1 SYNOPSIS

    with qw(KiokuDB::Role::Immutable::Transitive);

=head1 DESCRIPTION

This role makes a stronger promise than L<KiokuDB::Role::Immutable>, namely
that this object and all objects it points to are immutable.

These objects can be freely cached as live instances, since none of the data
they keep live is ever updated.

=cut
