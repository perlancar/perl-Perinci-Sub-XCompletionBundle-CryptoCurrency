package Perinci::Sub::XCompletion::cryptocurrency_code_or_name;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use Complete::Util qw(complete_array_elem);

our %SPEC;

$SPEC{gen_completion} = {
    v => 1.1,
};
sub gen_completion {
    require CryptoCurrency::Catalog;

    my %fargs = @_;

    my $cat = CryptoCurrency::Catalog->new;

    sub {
        my %cargs = @_;
        complete_array_elem(
            %cargs,
            array=>[map {($_->{code}, $_->{name})} $cat->all_data]);
    };
}

1;
# ABSTRACT: Generate completion for cryptocurrency code/name

=cut
