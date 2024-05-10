package journeyplanner

import (
	"github.com/stretchr/testify/assert"
	"testing"
)

var timetable = [][]string{
	{"Penzance", "St Erth", "Camborne", "Redruth", "Truro", "St Austell", "Par", "Bodmin Parkway", "Liskeard", "Plymouth", "Exeter St Davids", "Reading", "London Paddington"},
	{"0844", "0854", "0907", "0914", "0927", "0944", "0951", "1003", "1016", "1040", "1137", "1316", "1344"},
	{"1000", "1010", "1023", "1030", "1043", "1100", "1108", "1119", "1133", "1157", "1302", "1450", "1521"},
	{"1047", "1057", "1112", "1119", "1132", "1150", "1157", "1208", "1221", "1252", "1357", "1539", "1602"},
}

// Given
var planner = NewJourneyPlanner(timetable)

func TestShouldReportDurationOfJourneyBetweenTwoStations(t *testing.T) {
	// When
	duration := planner.durationOfJourneyStartingAt("0907", "Camborne", "Exeter St Davids")

	// Then
	assert.Equal(t, 150, duration)
}

func TestShouldReportDurationForFirstAvailableTrain(t *testing.T) {
	// When
	duration := planner.durationOfJourneyStartingAt("1023", "Camborne", "Exeter St Davids")

	// Then
	assert.Equal(t, 159, duration)
}

func TestShouldReportDurationIncludingWaitingTimeOnPlatform(t *testing.T) {
	// When
	duration := planner.durationOfJourneyStartingAt("1101", "St Austell", "Par")

	// Then
	assert.Equal(t, 56, duration)
}

func TestShouldReportFastestTrainBetweenTwoStations(t *testing.T) {
	// When
	actualTime := planner.fastestTrainBetween("Exeter St Davids", "Paddington")

	// Then
	assert.Equal(t, "1357", actualTime)
}

func TestShouldReportEarliestRouteWhenThereIsATieBetweenFastestTrains(t *testing.T) {
	// When
	actualTime := planner.fastestTrainBetween("Par", "Bodmin Parkway")

	// Then
	assert.Equal(t, "1108", actualTime)
}