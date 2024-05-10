# Train Timetable Interview Problem - TypeScript

## Context
You have been asked to work on the building an application to help people plan their train journeys on the Great Western Railway line from London Paddington to Penzance.

Your job is to implement a journey planner that provides travel times, and the fastest trains based on a supplied timetable.  The project has already been started by another developer in TypeScript using the Jest testing framework.

We would like you to continue with the work, where practical taking into account the application of a number of software engineering principles including:

* Domain-driven Design
* SOLID principles
* CleanCode
* Red-Green Refactoring

As well as adding tests and making them pass, please see this as an opportunity to: 

*  refactor the code to improve legibility and maintainability
*  refactor the code to improve the model of the data to be more object-oriented and domain specific
*  alternatively employ a more functional coding style appropriate to the programming language in use

You may use Google or another search engine to find reference resources for Javascript and TypeScript.
 
## Acceptance Criteria
|Criterion|Given|When|Then|
|---|-----|----|----|
|*Report Duration Of Journey Between Two Stations*|The 0907 train from Camborne is scheduled to reach Exeter St Davids at 1137|I ask for the journey time from Camborne to Exeter St Davids if I am at the station at 0907|I am told it will take 150 minutes|
|*Report Duration For First Available Train*|The 0907, 1023 and 1112 trains from Camborne are scheduled to reach Exeter St Davids at 1137, 1302 and 1357, respectively|I ask for the journey time from Camborne to Exeter St Davids if I am at the station at 1023|I am told it will take 159 minutes|
|*Report Duration Including Waiting Time On Platform*|The 0944, 1100 and 1150 trains from St Austell are scheduled to reach Par at 0951, 1108 and 1157, respectively|I ask for the journey time from St Austell to Par if I am at the station at 1101|I am told it will take 56 minutes|

## Technical Notes
* Initial package installation is done using `npm install` from the command line.
* The full train timetable for testing is provided in the file _tests/JourneyPlanner.test.ts_.  You may choose to change the structure holding the data but not the data themselves.
* The application development should be test-driven.
* We would expect you to write at least one test per acceptance criterium.
* It should be possible to run the tests from the command line using `npx jest`

## Hints

1. Focus on making all the provided acceptance criteria pass, before moving on to any _enhancements_.

1. With _TimeTable_, you could consider the first row as being the _route_ and the following rows as the distinct _trains_ following the route.

2. One of the forms of the JavaScript _Date_ constructor is `new Date(year, monthIndex, day, hours, minutes, seconds)`
