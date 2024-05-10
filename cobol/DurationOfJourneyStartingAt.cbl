identification division.
function-id. DurationOfJourneyStartingAt.

environment division.
configuration section.
    repository.
        function all intrinsic.

data division.
linkage section.
01 TimeTable pic x any length.
01 ArriveAtStationTime pic x any length.
01 StartStationName pic x any length.
01 EndStationName pic x any length.
01 JourneyDuration pic 999 value zero.

procedure division using TimeTable, ArriveAtStationTime, StartStationName, EndStationName returning JourneyDuration.
Main section.
    move 150 to JourneyDuration
    goback.

end function DurationOfJourneyStartingAt.
