
import { Injectable } from '@angular/core';

import {Observable, BehaviorSubject, ReplaySubject, of} from 'rxjs';

import {WebApiService} from 'app/web-api.service';
import { BattleRound } from 'types/battle-round';
import { Game } from 'types/game';
import { Player } from 'types/player';
import { Model } from 'types/model';

@Injectable({
  providedIn: 'root'
})

      // "currentTurn": "t1",
export class BattleRoundService {


  // game
  gameId!: number;
  game!: Game;
  currentTurn$ = new BehaviorSubject('t1');
  activatedPlayerId$ = new BehaviorSubject(1);
  activatedPlayer$ = new BehaviorSubject('p1');
  public availableTurns = ['t1', 't2', 't3', 't4'];
  // p1$!: Player;
  // p2$!: Player;
  // p2$ = new BehaviorSubject<Player>({});
  // p1Models$ = new BehaviorSubject([]);
  // p2Models$ = new BehaviorSubject([]);

  // private NEWGAME = (): Game => ({});

//   id:123
  public battleRounds = new BehaviorSubject<any[]>([]);

  private _orderCount = new BehaviorSubject<BattleRound[]>([]);
  private _orderCount$ = this._orderCount.asObservable();

  private _gameState = new BehaviorSubject<Game>({ 
    complete:false,
    p1Roster:<Model[]>[],
    p2Roster:<Model[]>[],
  });

  private _gameState$ = this._gameState.asObservable();

  constructor(private webApiService: WebApiService) { }

  getGameState(): Observable<Game> {
    return this._gameState$;
  }
  
  setGameState(latestValue: Game) {
    return this._gameState.next(latestValue);
  }

  resumeGame(gameId: number){
    this.gameId = gameId;
    this.webApiService.getOne('games', this.gameId, {}).subscribe((game: Game) => {
      this.setGameState(game);
      this.webApiService.getSome('models', {warband_id: game.p1WarbandId}).subscribe((models : Model[]) => {
        const readyModels = models.map((obj: Model) => {
          return {
            ...obj,
            activatedState: 'available'
          };
        });
        const tempData: Game = {...this._gameState.getValue(), p1Roster: readyModels };
        this.setGameState(tempData);
      });
      this.webApiService.getSome('models', {warband_id: game.p2WarbandId}).subscribe((models : Model[]) => {
        const readyModels = models.map((obj: Model) => {
          return {
            ...obj,
            activatedState: 'available'
          };
        });
        const tempData: Game = {...this._gameState.getValue(), p2Roster: readyModels };
        this.setGameState(tempData);
      });

    });

    this.webApiService.getSome('battlerounds', {gameId:this.gameId}).subscribe(
      (rounds) => this.setOrderCount(rounds)
    );
  }






  getOrderCount(): Observable<BattleRound[]> {
    return this._orderCount$;
  }
  
  setOrderCount(latestValue: BattleRound[]) {
    return this._orderCount.next(latestValue);
  }
               
  public activateModel =(model: Model, playerId: number) => {
    // console.log('mod', model, playerId)
    if(playerId == this._gameState.value.activatedPlayer){
      if(model.activatedState == 'available'){
    console.log('mod', model)
        this.endRound(model);
        model.activatedState = 'activated';
    //     addAction(player, model)
    //     if(false == checkHasMinis('p2') && false == checkHasMinis('p2')){
    //       // model.activatedState = 'activated'
    //       endRound()
    //     }
    //     else if(vm.activatedPlayer == 'p1'){
    //       if(checkHasMinis('p2')){
    //         this.activatedPlayer = 'p2';
    //       } 
    //     }
    //     else {
    //       if(checkHasMinis('p1')){
    //         vm.activatedPlayer = 'p1';
    //       }
    //     }
      }
    }
  }

  // <article class="played-turns">
  //                 @for (round of battleRounds$; track $index) {
  //                   <div>
  //                     <span class="turn">{{round.turn | uppercase}}</span>
  //                     <span class="player">{{round.activePlayerName}}</span>
  //                     <span class="thumb">
  //                       <img [src]="round.modelImage">
  //                     </span>
  //                     <span class="name">{{round.modelName}}</span>
  //                   </div>
  //                 }
  //               </article>


  //                <div class="col-md-4">
  //               <article class="burrow-box" *ngIf="playerData.length > 1; else loading;">
  //                   <h1 *ngIf="playerData">{{playerData[1].name}}</h1>
  //                   <app-model-dex [roster]="gameState.p2Roster"></app-model-dex>
  //               </article>
  //           </div>

  public endRound = (model:Model) => {    
    let game = this._gameState.value;

    let round: BattleRound = {
      id: Math.floor(Math.random()),
      gameId: this.gameId,
      turn: this.currentTurn$.value,
      activePlayerId: this.activatedPlayerId$.value,
      activePlayerName: 'player_'+this.activatedPlayer$.value,
      modelImage: model.image,
      modelName: model.name,
      modelId: model.id
    }

    this.webApiService.post('battlerounds', round).subscribe(()=>{
      this.webApiService.getSome('battlerounds', {gameId:this.gameId}).subscribe(
        (rounds) => this.setOrderCount(rounds)
      );
    });
  }

  //   activateModel(){

  //   this.currentTurn$.next('t2');

  // }
  
  // checkHasMinis(player: string){
    // let response = false;
    // let list = vm[player].list;
    // for (var i = list.length - 1; i >= 0; i--) {
    //   if(list[i].activatedState == 'available'){
    //     response = true;
    //   }
    // }
    // return response;
  // }

    //   loadDataWithCurrentState() {
    //   combineLatest([this.filter$, this.sort$, this.currentPage$])
    //     .pipe(take(1))
    //     .subscribe(([filter, sort, currentPage]) => {
    //       this.http.post(...).subscribe(response => {
    //         const { data, totalPage } = response.body;
    //         this.totalPage$.next(totalPage);
    //         this.data$.next(data);
    //       })
    //     });
    // }

  // function addAction(player, model){
  //   vm.gameState = {player:player,model:model};

  //   vm.playedActions.push({
  //     turn:vm.availableTurns[vm.currentTurn],
  //     player:player,
  //     model:model,
  //   })
  // }

  // function endTurn(){
  //   if(vm.currentTurn < vm.availableTurns.length){

  //     vm.currentTurn++;
  //     vm.activatedPlayer = 'p1' 
  //     models = vm.p1.list;
  //     for (var i = models.length - 1; i >= 0; i--) {
  //       models[i]['activatedState'] = 'available';
  //     }
  //     models = vm.p2.list;
  //     for (var i = models.length - 1; i >= 0; i--) {
  //       models[i]['activatedState'] = 'available';
  //     }
  //     vm.p2.list = models;
  //   } else {
  //     alert('game over');
  //   }
  // }


          
}


