package journeyplanner

import (
	"math"
	"time"
)

type JourneyPlanner struct {
	Trains []Train
}

type Train struct {
	Stops map[string]time.Time
}

func NewJourneyPlanner(timeTable [][]string) JourneyPlanner {
	route := timeTable[0]
	journeys := timeTable[1:]

	planner := JourneyPlanner{}
	for _, journey := range journeys {
		newTrain := Train{
			Stops: make(map[string]time.Time),
		}

		for stopNumber := range journey[0:] {
			timeAtStop, _ := time.Parse("1504", journey[stopNumber])
			newTrain.Stops[route[stopNumber]] = timeAtStop
		}
		planner.Trains = append(planner.Trains, newTrain)
	}
	return planner
}

func (t Train) timeAt(stationName string) time.Time {
	return t.Stops[stationName]
}

func (p JourneyPlanner) durationOfJourneyStartingAt(arriveAtStationTime, startStationName, endStationName string) int {
	var myTrain Train
	arrivalTime, _ := time.Parse("1504", arriveAtStationTime)
	for _, train := range p.Trains {
		if arrivalTime.Before(train.timeAt(startStationName)) || arrivalTime.Equal(train.timeAt(startStationName)) {
			myTrain = train
			break
		}
	}
	return int(myTrain.timeAt(endStationName).Sub(arrivalTime).Minutes())
}

func (p JourneyPlanner) fastestTrainBetween(startStationName, endStationName string) string {
	var fastestTrain Train
	var shortestTime = math.MaxInt
	for _, train := range p.Trains {
		durationOfJourney := p.durationOfJourneyStartingAt(train.timeAt(startStationName).Format("1504"), startStationName, endStationName)
		if durationOfJourney < shortestTime {
			shortestTime = durationOfJourney
			fastestTrain = train
		}
	}
	return fastestTrain.timeAt(startStationName).Format("1504")
}

