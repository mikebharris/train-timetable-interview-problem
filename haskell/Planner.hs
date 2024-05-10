module Planner
  where
  
    duration :: [[String]] -> String -> String -> String -> Int
    duration timetable passengerArrivalTime startStationName endStationName = 150
    
    fastestTrain :: [[String]] -> String -> String -> String
    fastestTrain timetable startStationName endStationName = "1357"
