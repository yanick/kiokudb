package KiokuDB::Role::UUIDs::LibUUID;
use Moose::Role;

use Data::UUID::LibUUID 0.05;

use namespace::clean -except => 'meta';

sub generate_uuid { Data::UUID::LibUUID::new_uuid_string() }

__PACKAGE__

__END__
