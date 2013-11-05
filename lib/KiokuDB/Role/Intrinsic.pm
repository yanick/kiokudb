package KiokuDB::Role::Intrinsic;
use Moose::Role;
# ABSTRACT: A role for value objects

use namespace::clean -except => 'meta';



__PACKAGE__

__END__

=pod

=head1 SYNOPSIS

    with qw(KiokuDB::Role::Intrinsic);

=head1 DESCRIPTION

When L<KiokuDB> detects this role on objects they are collapsed into their
parent by default, without needing an explicit typemap entry.

=cut
