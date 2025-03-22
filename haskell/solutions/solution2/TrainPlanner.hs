module TrainPlanner where

  import qualified Data.Map
  import Data.Char ( isDigit )
  import Data.List (elemIndex)
  
  type Station = String
  type Time = String
  type Timetable = [[String]]
  type Route = [String]
  type Train = Data.Map.Map Station Time
  data JourneyPlannerError = InvalidTimeError | NoSuchStationError | NoSuchJourneyError deriving (Show, Eq)

  duration :: Timetable -> Time -> Station -> Station -> Either JourneyPlannerError Int
  duration timetable timeWeArriveAtDepartureStation departureStation destinationStation
    | not (isValidTime timeWeArriveAtDepartureStation) = Left InvalidTimeError
    | not (isValidStation route departureStation) = Left NoSuchStationError
    | not (isValidStation route destinationStation) = Left NoSuchStationError
    | not (isValidJourney route departureStation destinationStation) = Left NoSuchJourneyError
    | otherwise = Right $ minutesBetween timeTrainArrivesAtDestinationStaion timeWeArriveAtDepartureStation 
    where
      route = head timetable
      trains = extractTrainsFrom timetable
      timeTrainArrivesAtDestinationStaion = timeAt destinationStation nextTrain 
      nextTrain = head $ filter (\t -> timeWeArriveAtDepartureStation <= timeAt departureStation t) trains

  departureTimeOfFastestTrain :: Timetable -> Station -> Station -> Either JourneyPlannerError Time
  departureTimeOfFastestTrain timetable departureStation destinationStation
    | not (isValidStation route departureStation) = Left NoSuchStationError
    | not (isValidStation route destinationStation) = Left NoSuchStationError
    | not (isValidJourney route departureStation destinationStation) = Left NoSuchJourneyError
    | otherwise = Right $ timeAt departureStation fastestTrain  
    where
      route = head timetable
      trains = extractTrainsFrom timetable
      fastestTrain = fastestTrainBetween departureStation destinationStation trains

  extractTrainsFrom :: Timetable -> [Train]
  extractTrainsFrom (stations:timesOfTrains) = map (makeTrain stations) timesOfTrains where
    makeTrain stations times = Data.Map.fromList $ zip stations times

  fastestTrainBetween :: Station -> Station -> [Train] -> Train
  fastestTrainBetween _ _ [t] = t
  fastestTrainBetween s1 s2 (t:ts) = fasterTrain t $ fastestTrainBetween s1 s2 ts where
    fasterTrain t1 t2 = if journeyTime t1 > journeyTime t2 then t2 else t1 where
      journeyTime t = minutesBetween (timeAt s2 t) (timeAt s1 t)

  minutesBetween :: Time -> Time -> Int
  minutesBetween time1 time2 = abs (toMinutes time1 - toMinutes time2) where
    toMinutes t = hourPart t * 60 + minutePart t

  minutePart :: Time -> Int
  minutePart t = read (drop 2 t)

  hourPart :: Time -> Int
  hourPart t = read (take 2 t)

  timeAt :: Station -> Train -> Time
  timeAt station train = time where
    (Just time) = Data.Map.lookup station train

  isValidTime :: Time -> Bool
  isValidTime t = (length t == 4) && all isDigit t && (minutePart t < 60) && (hourPart t < 24)
  
  isValidStation :: Route -> Station -> Bool
  isValidStation route station = station `elem` route

  isValidJourney :: Route -> Station -> Station -> Bool
  isValidJourney route departureStation destinationStation = departureIndex < destinationIndex where
    (Just departureIndex) = elemIndex departureStation route
    (Just destinationIndex) = elemIndex destinationStation route

