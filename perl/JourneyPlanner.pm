package JourneyPlanner;
use Moose;

has 'timetable' => (is => 'ro', isa => 'ArrayRef[ArrayRef[Str]]', required => 1);

sub duration() {
    my $self = shift;
    return 150
}

return 1;
