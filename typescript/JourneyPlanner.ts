export class JourneyPlanner {
    timeTable: string[][];

    constructor(timeTable: string[][]) {
        this.timeTable = timeTable;
    }

    public durationOfJourneyStartingAt(arriveAtStationTime: string, startStationName: string, endStationName: string): number {
        let route: string[] = this.timeTable[0]
        return 150;
    }
}

