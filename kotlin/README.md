# Train Timetable Interview Problem - Kotlin

## Context
You have been asked to work on the building an application to help people plan their train journeys on the Great Western Railway line.

Your job is to implement a journey planner that provides travel times based on a supplied timetable.  The project has already been started by another developer.

We would like you to continue with the work, taking into account the application of a number of software engineering principles including:

* Domain-driven Design
* SOLID principles
* CleanCode
* Red-Green Refactoring

As well as adding tests and making them pass, please see this as an oppotunity to: 

*  refactor the code to improve legibility and maintainability
*  refactor the code to improve the model of the data to be more object-oriented and domain specific

You may use Google or another search engine to find reference resources for Kotlin.
 
## Acceptance Criteria
|Criterion|Given|When|Then|
|---|-----|----|----|
|*Report Duration Of Journey Between Two Stations*|The 0907 train from Camborne is scheduled to reach Exeter St Davids at 1137|I ask for the journey time from Camborne to Exeter St Davids if I am at the station at 0907|I am told it will take 150 minutes|
|*Report Duration For First Available Train*|The 0907, 1023 and 1112 trains from Camborne are scheduled to reach Exeter St Davids at 1137, 1302 and 1357, respectively|I ask for the journey time from Camborne to Exeter St Davids if I am at the station at 1023|I am told it will take 159 minutes|
|*Report Duration Including Waiting Time On Platform*|The 0944, 1100 and 1150 trains from St Austell are scheduled to reach Par at 0951, 1108 and 1157, respectively|I ask for the journey time from St Austell to Par if I am at the station at 1101|I am told it will take 56 minutes|

## Technical Notes
* The full train timetable for testing is provided in the `TestData` object.
* The journey planner should be written using Kotlin 1.3 or later.
* You should minimise the use of Java code, using Kotlin native libraries where possible.
* The application should be test-driven.
* We would expect you to write at least one test per acceptance criterium.
* It should be possible to run the tests using `./gradle clean test` from within the top-level directory

## Hints

To return the time in minutes between two given times, you could use the Java's Duration:

```Duration.between(startTime, endTime).toMinutes()```

This takes two parameters of class LocalTime.  A LocalTime object can be built from like this:

```val time = LocalTime.parse("1005", DateTimeFormatter.ofPattern("HHmm"))```

In TestData.TIMETABLE, you could consider the first row as being the ''route'' and the following rows as the 
distinct "trains" following the route.
