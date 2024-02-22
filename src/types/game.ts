import { Model } from 'types/model';

export interface Game {
	id?: number;
	p1Id?: number;
	p1WarbandId?: number;
	p1Roster?: Model[];
	p2Id?: number;
	p2WarbandId?: number;
	p2Roster?: Model[];
	currentTurn?: string;
	goesFirst?: number;
	gameLength?: Array<string>;
	activatedPlayer?: number;
	// date?: strin;
    complete?: boolean;
}