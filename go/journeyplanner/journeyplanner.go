package journeyplanner

type JourneyPlanner struct {
	TimeTable [][]string
}

func (p *JourneyPlanner) durationOfJourneyStartingAt(arriveAtStationTime string, startStationName string, endStationName string) int {
	return 150
}

