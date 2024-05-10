identification division.
program-id. JourneyPlannerTest.

environment division.
configuration section.
    repository.
        function DurationOfJourneyStartingAt
        function all intrinsic.

data division.
working-storage section.

    01 ExpectedResult pic 999 usage binary.
    01 ReturnedResult pic 999 usage binary.
    01 StringToTest   pic x(40).
    01 TimeTable.
        02 StationNames.
            03 filler pic x(20) value "Penzance".
            03 filler pic x(20) value "St Erth".
            03 filler pic x(20) value "Camborne".
            03 filler pic x(20) value "Redruth".
            03 filler pic x(20) value "Truro".
            03 filler pic x(20) value "St Austell".
            03 filler pic x(20) value "Par".
            03 filler pic x(20) value "Bodmin Parkway".
            03 filler pic x(20) value "Liskeard".
            03 filler pic x(20) value "Plymouth".
            03 filler pic x(20) value "Exeter St Davids".
            03 filler pic x(20) value "Reading".
            03 filler pic x(20) value "London Paddington".
        02 filler redefines StationNames.
            03 StationName pic x(20) occurs 13 times.
        02 FirstTrainTimes pic x(52) value "0844085409070914092709440951100310161040113713161344".
        02 SecondTrainTimes pic x(52) value "1000101010231030104311001108111911331157130214501521".
        02 ThirdTrainTimes pic x(52) value "1047105711121119113211501157120812211252135715391602".

procedure division.

ShouldReportDurationOfJourneyBetweenTwoStations.
    move 150 to ExpectedResult
    move DurationOfJourneyStartingAt(TimeTable, "0907", "Camborne", "Exeter St Davids") to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "Correctly reports duration of journey between two stations 150"
    .

ShouldReportDurationForFirstAvailableTrain.
    move 159 to ExpectedResult
    move DurationOfJourneyStartingAt(TimeTable, "1023", "Camborne", "Exeter St Davids") to ReturnedResult
    call "AssertEquals" using ReturnedResult, ExpectedResult, "Duration of journey with first available train is 159"
    .

    *> More tests here

stop run.
