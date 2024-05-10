package com.elsevier.rt.interviewproblems.traintimetable

import org.assertj.core.api.Assertions.assertThat
import org.junit.jupiter.api.Test

internal class JourneyPlannerTest {

    @Test
    fun shouldReportDurationOfJourneyBetweenTwoStations() {
        // Given
        val journeyPlanner = JourneyPlanner(TestData.TIMETABLE)

        // When
        val duration = journeyPlanner.durationOfJourneyStartingAt("0907", "Camborne", "Exeter St Davids")

        // Then
        assertThat(duration).isEqualTo(150)
    }

    @Test
    fun shouldReportDurationForFirstAvailableTrain() {
        // Given
        val journeyPlanner = JourneyPlanner(TestData.TIMETABLE)

        // When
        val duration = journeyPlanner.durationOfJourneyStartingAt("1023", "Camborne", "Exeter St Davids")

        // Then
        assertThat(duration).isEqualTo(159)
    }

    // More tests here

}