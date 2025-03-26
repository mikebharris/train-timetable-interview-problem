package JourneyPlanner;
use Moose;

has 'timetable' => (is => 'ro', isa => 'ArrayRef[ArrayRef[Str]]', required => 1);

sub duration() {
    my $self = shift;
    my $route = Route->new(@{@{ $self->timetable }[0]});
    $route->list();
    return 150
}

return 1;

package Route;
use Moose;

has 'stations' => (is => 'ro', isa => 'ArrayRef[Str]', required => 1);

sub list() {
    my $self = shift;
    print $self->stations;
}

return 1;