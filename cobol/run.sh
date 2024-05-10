#!/bin/sh
echo "Building..."
cobc -free AssertEquals.cbl
cobc -x --free JourneyPlannerTest.cbl DurationOfJourneyStartingAt.cbl AssertEquals.cbl
echo "Running tests..."
./JourneyPlannerTest
echo "Finished"
