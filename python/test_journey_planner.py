import unittest
from journey_planner import JourneyPlanner

time_table = [
    ["Penzance", "St Erth", "Camborne", "Redruth", "Truro", "St Austell", "Par", "Bodmin Parkway", "Liskeard",
     "Plymouth", "Exeter St Davids", "Reading", "London Paddington"],
    ["0844", "0854", "0907", "0914", "0927", "0944", "0951", "1003", "1016", "1040", "1137", "1316", "1344"],
    ["1000", "1010", "1023", "1030", "1043", "1100", "1108", "1119", "1133", "1157", "1302", "1450", "1521"],
    ["1047", "1057", "1112", "1119", "1132", "1150", "1157", "1208", "1221", "1252", "1357", "1539", "1602"]
]


class JourneyPlannerTests(unittest.TestCase):

    def test_should_report_duration_of_journey_between_two_stations(self):
        journey_planner = JourneyPlanner(time_table)
        result = journey_planner.duration_of_journey_starting_at("0907", "Camborne", "Exeter St Davids")
        self.assertEqual(150, result)

    def test_should_report_duration_for_first_available_train(self):
        journey_planner = JourneyPlanner(time_table)
        result = journey_planner.duration_of_journey_starting_at("1023", "Camborne", "Exeter St Davids")
        self.assertEqual(159, result)

    # more tests here ;)


if __name__ == '__main__':
    unittest.main()
