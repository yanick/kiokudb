#!/usr/bin/perl

use strict;
use warnings;

use Test::More;
use Test::Moose;

use constant HAVE_YAML => eval { require YAML::XS } ? 1 : 0;

use KiokuDB::Serializer;
use KiokuDB::Serializer::JSON;
use KiokuDB::Serializer::Storable;
use if HAVE_YAML, 'KiokuDB::Serializer::YAML';

use KiokuDB::Entry;

sub KiokuDB::Entry::BUILD { shift->root }; # force building of root for is_deeply
$_->make_mutable, $_->make_immutable for KiokuDB::Entry->meta; # recreate new


foreach my $serializer ( qw(JSON Storable), HAVE_YAML ? "YAML" : () ) {
    subtest "serializer $serializer" => sub {
        my $s = "KiokuDB::Serializer::$serializer"->new;

        does_ok( $s, "KiokuDB::Serializer" );
        does_ok( $s, "KiokuDB::Backend::Serialize" );

        my $entry = KiokuDB::Entry->new(
            class => "KiokuDB_Test_Foo",
            data  => { foo => "bar" },
        );

        my $ser = $s->serialize( $entry );

        ok( !ref($ser), "non ref" );
        ok( length($ser), "got data" );

        is_deeply( $s->deserialize($ser), $entry, "round tripping" );

        my $buf = '';

        open my $out, ">", \$buf;

        $s->serialize_to_stream($out, $entry) for 1 .. 3;

        close $out;

        ok( length($buf), "serialize_to_stream" );

        open my $in, "<", \$buf;

        my @entries;

        my $n;

        while ( my @got = $s->deserialize_from_stream($in) ) {
            $n++;
            push @entries, @got;
        }

        is( scalar(@entries), 3, "three entries from stream ($n reads)" );

        isa_ok( $_, "KiokuDB::Entry" ) for @entries;

        is_deeply( $entries[0], $entry, "round tripping" );
    }
}


done_testing;
