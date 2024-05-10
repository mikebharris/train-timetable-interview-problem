package train_timetable_interview_problem;

import static org.hamcrest.core.Is.is;
import static org.hamcrest.core.IsEqual.equalTo;
import static org.junit.Assert.assertThat;

import org.junit.Ignore;
import org.junit.Test;

public class JourneyPlannerTest {

    @Test
    public void shouldReportDurationOfJourneyBetweenTwoStations() {
        // Given
        JourneyPlanner journeyPlanner = new JourneyPlanner(TestData.TIMETABLE);

        // When
        int duration = journeyPlanner.durationOfJourneyStartingAt("0907", "Camborne", "Exeter St Davids");

        // Then
        assertThat(duration, is(equalTo(150)));
    }

    @Test
    @Ignore
    public void shouldReportDurationForFirstAvailableTrain() {
        // Given
        JourneyPlanner journeyPlanner = new JourneyPlanner(TestData.TIMETABLE);

        // When
        int duration = journeyPlanner.durationOfJourneyStartingAt("1023", "Camborne", "Exeter St Davids");

        // Then
        assertThat(duration, is(equalTo(159)));
    }

    // More tests here
}
