package KiokuDB::Backend::Role::TXN::Nested;
use Moose::Role;
# ABSTRACT: Informational role for backends supporting rollback of nested transactions.

use namespace::clean -except => 'meta';

__PACKAGE__

__END__

=pod

=head1 DESCRIPTION

This role is used during testing to run fixtures testing that a rollback of a
nested transaction doesn't affect its parent transaction.

=cut
