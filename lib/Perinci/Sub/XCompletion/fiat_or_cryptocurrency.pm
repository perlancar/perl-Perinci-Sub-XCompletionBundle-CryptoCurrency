package Perinci::Sub::XCompletion::fiat_or_cryptocurrency;

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
    require Locale::Codes::Currency_Codes;

    my %fargs = @_;

    my $cat = CryptoCurrency::Catalog->new;

    sub {
        my %cargs = @_;
        complete_array_elem(
            %cargs,
            array => [
                (keys %{ $Locale::Codes::Data{currency}{code2id}{alpha} }),
                (map {($_->{code}, $_->{name}, $_->{safename})} $cat->all_data),
            ]);
    };
}

1;
# ABSTRACT: Generate completion for fiat currency code or cryptocurrency code/name/safename

=cut
