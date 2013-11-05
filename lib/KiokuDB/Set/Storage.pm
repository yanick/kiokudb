package KiokuDB::Set::Storage;
use Moose::Role;
# ABSTRACT: Role for KiokuDB::Sets that are tied to storage.

use Set::Object;

use namespace::clean -except => 'meta';

with qw(KiokuDB::Set);

__PACKAGE__

__END__

=pod

=head1 SYNOPSIS

    # informational role, used internally

=head1 DESCRIPTION

This role is informational, and implemented by L<KiokuDB::Set::Deferred> and
L<KiokuDB::Set::Loaded>

=cut
