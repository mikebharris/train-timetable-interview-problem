identification division.
function-id. DurationOfJourneyStartingAt.

environment division.
configuration section.
    repository.
        function all intrinsic.

data division.
working-storage section.
01 RouteTimeTable.
    02 StationNames occurs 13 times indexed by StationIndex.
        03 StationName pic x(20).
    02 Trains occurs 3 times.
        03 TrainTimes occurs 13 times.
            04 TrainTimeHH pic 99.
            04 TrainTimeMM pic 99.

01 StartStationIndex pic 99.
01 EndStationIndex pic 99.
01 Train pic 9999.
01 StartTime.
    02 StartTimeHH pic 99.
    02 StartTimeMM pic 99.
01 EndTime.
    02 EndTimeHH pic 99.
    02 EndTimeMM pic 99.
01 filler pic 9 binary.
    88 TrainFound value 1 when set to false is 0.

linkage section.
01 TimeTable pic x any length.
01 ArriveAtStationTime pic 9999.
01 StartStationName pic x any length.
01 EndStationName pic x any length.
01 JourneyDuration pic 999 value zero.

procedure division using TimeTable, ArriveAtStationTime, StartStationName, EndStationName returning JourneyDuration.
Main section.
    move TimeTable to RouteTimeTable

    set StationIndex to 1
    search StationNames
        at end display "Start station not found"
        when StationName(StationIndex) is equal to StartStationName
            set StartStationIndex to StationIndex
    end-search

    set StationIndex to 1
    search StationNames
        at end display "End station not found"
        when StationName(StationIndex) is equal to EndStationName
            set EndStationIndex to StationIndex
    end-search

    set TrainFound to false
    perform with test after varying Train from 1 by 1 until TrainFound or Train is equal to 3
        if TrainTimes(Train, StartStationIndex) is greater than or equal to ArriveAtStationTime then
            move TrainTimes(Train, StartStationIndex) to StartTime
            move TrainTimes(Train, EndStationIndex) to EndTime
            set TrainFound to true
        end-if
    end-perform

    if StartTime is greater than ArriveAtStationTime then
        move ArriveAtStationTime to StartTime *> from the passenger's point of view this is when the journey started
    end-if

    if EndTimeHH is less than StartTimeHH then
        add 24 to EndTimeHH
    end-if

    compute JourneyDuration = (EndTimeHH * 60 + EndTimeMM) - (StartTimeHH * 60 + StartTimeMM)

    goback.

end function DurationOfJourneyStartingAt.
