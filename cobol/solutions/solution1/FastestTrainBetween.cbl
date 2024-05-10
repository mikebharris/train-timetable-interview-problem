identification division.
function-id. FastestTrainBetween.

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

01 JourneyDurations occurs 3 times.
    02 JourneyInMinutes pic 999.
01 ShortestJourneyInMinutes pic 999 value 999.
01 ThisJourneyInMinutes pic 999 value zero.

linkage section.
01 TimeTable pic x any length.
01 StartStationName pic x any length.
01 EndStationName pic x any length.
01 FastestTrain pic 9999 value zero.

procedure division using TimeTable, StartStationName, EndStationName returning FastestTrain.
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

    perform with test after varying Train from 1 by 1 until Train is equal to 3
        compute ThisJourneyInMinutes = 
           (TrainTimeHH(Train, EndStationIndex) * 60 + TrainTimeMM(Train, EndStationIndex))
            - (TrainTimeHH(Train, StartStationIndex) * 60 + TrainTimeMM(Train, StartStationIndex))
        if ThisJourneyInMinutes is less than ShortestJourneyInMinutes then
            move ThisJourneyInMinutes to ShortestJourneyInMinutes
            move TrainTimes(Train, StartStationIndex) to FastestTrain
        end-if
    end-perform

    goback.

end function FastestTrainBetween.
