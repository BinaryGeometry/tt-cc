export interface BattleRound {
	id?:number;
	gameId: number;
	turn: string;
	activePlayerId:number;
	activePlayerName:string;
	// actions:Array<any>;
    modelImage: string;
    modelName: string;
    modelId: number;
}