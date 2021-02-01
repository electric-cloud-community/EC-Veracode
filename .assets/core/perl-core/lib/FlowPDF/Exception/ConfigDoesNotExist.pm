package FlowPDF::Exception::ConfigDoesNotExist;

use base qw/FlowPDF::Exception/;
use strict;
use warnings;

sub exceptionCode {
    return 'CBF0009CNE';
}

sub render {
    my ($self, $params) = @_;

    my $message = q|Can't get config.|;

    if (!ref $params) {
        $params ||= $message;
        return $params;
    }

    if ($params->{configName}) {
        $message = qq|Configuration '$params->{configName}' does not exist.|;
    }

    return $message;
}


=head1 NAME

FlowPDF::Exception::ConfigDoesNotExist

=head1 AUTHOR

CloudBees

=head1 DESCRIPTION

An exception that represents a situation when configuration does not exist.

=head1 USAGE

This exception could be created using new() method in one of the following ways:

=over

=item No parameters

Exception with default message will be created.

=item Custom scalar parameter

Exception with custom message will be created.

=item hashref with the following fields as parameter:

B<Note:> you may not use all of these arguments at once. It is allowed to omit some of them.

=over 4

=item configName

A name of the config that does not exist

=back

=back

%%%LANG%%%

FlowPDF::Exception::ConfigDoesNotExist->new({
    configName => 'DoesNotExist'
})->throw();

%%%LANG%%%

=cut


1;
