import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import TrainPlanner

timetable :: [[String]]
timetable = [["Penzance", "St Erth", "Camborne", "Redruth", "Truro", "St Austell", "Par", "Bodmin Parkway", "Liskeard", "Plymouth", "Exeter St Davids", "Reading", "London Paddington"],
             ["0844", "0854", "0907", "0914", "0927", "0944", "0951", "1003", "1016", "1040", "1137", "1316", "1344"],
             ["1000", "1010", "1023", "1030", "1043", "1100", "1108", "1119", "1133", "1157", "1302", "1450", "1521"],
             ["1047", "1057", "1112", "1119", "1132", "1150", "1157", "1208", "1221", "1252", "1357", "1539", "1602"]]

main :: IO ()
main = hspec $ do
  describe "TrainPlanner.duration" $ do
    it "should report the duration of journey between two stations" $ do
      duration timetable "0907" "Camborne" "Exeter St Davids" `shouldBe` Right (150 :: Int)

    it "should report the duration for first available train" $ do
      duration timetable "1023" "Camborne" "Exeter St Davids" `shouldBe` Right (159 :: Int)

    it "should report the duration including waiting time at platform" $ do 
      duration timetable "1101" "St Austell" "Par" `shouldBe` Right (56 :: Int)

    it "should report the duration including waiting time at platform for first train when there is more than one train that departs on or after the time the passenger presents themselves at the station" $ do 
      duration timetable "0800" "Penzance" "St Erth" `shouldBe` Right (54 :: Int)

    it "should return an InvalidTimeError when given an invalid number of minutes" $ do 
      duration timetable "0999" "Penzance" "St Erth" `shouldBe` Left InvalidTimeError

    it "should return an InvalidTimeError when given an invalid number of hours" $ do 
      duration timetable "8800" "Penzance" "St Erth" `shouldBe` Left InvalidTimeError

    it "should return an InvalidTimeError when time given has an invalid number of digits" $ do 
      duration timetable "123" "Penzance" "St Erth" `shouldBe` Left InvalidTimeError

    it "should return an InvalidTimeError when time given has a non-digits" $ do 
      duration timetable "$a$a" "Penzance" "St Erth" `shouldBe` Left InvalidTimeError

    it "should return a NoSuchStationError when start station cannot be found in timetable" $ do 
      duration timetable "0800" "Nottingham" "St Erth" `shouldBe` Left NoSuchStationError


    it "should return a NoSuchStationError when end station cannot be found in timetable" $ do 
      duration timetable "0800" "Penzance" "Nottingham" `shouldBe` Left NoSuchStationError

    it "should return a NoSuchJourneyError when end station is before start station" $ do 
      duration timetable "0800" "Par" "Penzance" `shouldBe` Left NoSuchJourneyError

    it "should return a NoSuchJourneyError when end station == start station" $ do 
      duration timetable "0800" "Par" "Par" `shouldBe` Left NoSuchJourneyError

  describe "TrainPlanner.fastestTrain" $ do
    it "should report the fastest train between two stations" $ do 
      departureTimeOfFastestTrain timetable "Exeter St Davids" "London Paddington" `shouldBe` Right ("1357" :: String)
  describe "TrainPlanner.fastestTrain" $ do
    it "should report the earliest of two trains when there is a tie between fastest trains" $ do 
      departureTimeOfFastestTrain timetable "Par" "Bodmin Parkway" `shouldBe` Right ("1108" :: String)