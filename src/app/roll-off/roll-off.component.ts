import { Component, inject, OnInit  } from '@angular/core';
import { CommonModule } from '@angular/common';

import {ApiService} from 'app/api.service';
import {WebApiService} from 'app/web-api.service';
import {BattleRoundService} from 'app/battle-round.service';
import { BattleRound } from 'types/battle-round';
import {ModelDexComponent} from 'app/model-dex/model-dex.component';

import { Player } from 'types/player';
import { Game } from 'types/game';

@Component({
  selector: 'app-roll-off',
  standalone: true,
  imports: [CommonModule, ModelDexComponent],
  template:`
     <section>
                    
        <div class="row">
            <div class="col-md-4">
                <article class="burrow-box" 
                *ngIf="
                gameState.p1Id != undefined 
                && gameState.p1Roster != undefined 
                && gameState.p1Roster.length > 1; 
                else loading;">
                    <app-model-dex 
                    [playerId]="gameState.p1Id"
                    [roster]="gameState.p1Roster"
                    >
                    </app-model-dex>
                </article>
                <ng-template #loading>
                    <h2>loading</h2>
                </ng-template>
            </div>
            <div class="col-md-4" style="backgrou nd:gold">
                
                <div class="turn-counter">
                  @for (turn of battleRoundService.availableTurns; track $index) {
                    <p [ngClass]="{'active-turn':turn == battleRoundService.currentTurn$.value}">
                      {{turn}} 
                      <span *ngIf="turn == battleRoundService.currentTurn$.value">
                       | {{ battleRoundService.activatedPlayer$.value }}
                      </span>
                    </p>
                  }
                </div>

                <article class="played-turns">
                  @for (round of orderCount; track $index) {
                    <div>
                      <span class="turn">{{round.turn | uppercase}}</span>
                      <span class="player">{{round.activePlayerName}}</span>
                      <span class="thumb">
                        <img [src]="round.modelImage">
                      </span>
                      <span class="name">{{round.modelName}}</span>
                    </div>
                  }
                </article>

                <section ui-view="context">
                </section>
            </div>
            <div class="col-md-4">
                <article class="burrow-box" 
                *ngIf="
                gameState.p2Id != undefined 
                && gameState.p2Roster != undefined 
                && gameState.p2Roster.length > 1; 
                else loading;">
                    <app-model-dex 
                    [playerId]="gameState.p2Id"
                    [roster]="gameState.p2Roster"
                    ></app-model-dex>
                </article>
                <ng-template #loading>
                    <h2>loading</h2>
                </ng-template>
            </div>
           
        </div>
    </section>
  `,
  styleUrl: './roll-off.component.scss'
})
export class RollOffComponent implements OnInit {

  playerData: any[] = [];
  battleRounds: any;
  orderCount: BattleRound[] = [];
  gameState!: Game;
  // battleRounds$ = this.battleRoundService.battleRounds;

  constructor(private webApiService: WebApiService, public battleRoundService: BattleRoundService) {}

  ngOnInit(): void {
    // this.getGame();

    this.battleRoundService.resumeGame(123);

    this.battleRoundService.getOrderCount().subscribe((orderCount) => {
        this.orderCount = orderCount;
    })

    this.battleRoundService.getGameState().subscribe((gameState) => {
        console.log(gameState)
        this.gameState = gameState;
    })

    // this.battleRounds = this.battleRoundService.battleRounds
    // this.battleRoundService.joinGame(123).subscribe((res)=>{return res})
    // this.battleRoundService.joinGame(123)
    // .subscribe(data => {
    //   console.log('data', data.body);
    //   this.battleRoundService.battleRounds.next(data.body)
    //   // console.log('battleRounds$ ', this.battleRounds$ );

    // })

    // );
  //     getProducts(gameId: number): Observable<BattleRound[]> {
  //     return this.webApiService.getSome('battlerounds', {gameId:gameId})
  // }

  //   this.battleRoundService.getProducts(123).subscribe(
  //       (products) => {
  //           console.log(products);
  //           // this.battleRounds = products
  //           this.battleRoundService.battleRounds.next(products)
  //       }
  }


  async getGame() {
    this.webApiService.getSome('players', {}).subscribe((data : any) => {
      console.log(data, typeof data)
      this.playerData = data;
    })
  }
        //   let vm = this;
        // vm.p1 = {
        //     player_id:'p1',
        //     warband_id:$scope.settings.p1
        // }
        // vm.p2 = {
        //     player_id:'p2',
        //     warband_id:$scope.settings.p2
        // }
        // EngineFactory['loadJSON']("aahRoster_list", {warband_id:vm.p1.warband_id}).then(function(res){
        //     vm.p1.list = res.tableParams;
        //     RollService.setp1 = vm.p1;
        //     console.log('vm.p1',vm.p1)
        // });
        // EngineFactory['loadJSON']("aahRoster_list", {warband_id:vm.p2.warband_id}).then(function(res){
        //     vm.p2.list = res.tableParams;
        //     RollService.setp2 = vm.p2;
        //     console.log('vm.p1',vm.p2)
        // });
}
