import { Injectable } from '@angular/core';

import { Battleround } from 'types/battleround';
import { Game } from 'types/game';
import { Model } from 'types/model';
import { Player } from 'types/player';
import { Warband } from 'types/warband';

@Injectable({
  providedIn: 'root'
})
export class GameService {

  constructor() { }

  readonly baseUrl = 'http://localhost:4200/assets';

  warbandUrl = 'http://localhost:3000/locations';
  playerUrl = 'http://localhost:3000/locations';
  gameUrl = 'http://localhost:3000/locations';
  modelUrl = 'http://localhost:3000/locations';
  battleroundUrl = 'http://localhost:3000/locations';

  async getAllHousingLocations(): Promise<HousingLocation[]> {
    const data = await fetch(this.url);
    return (await data.json()) ?? [];
  }

  async getHousingLocationById(id: number): Promise<HousingLocation | undefined> {
    const data = await fetch(`${this.url}/${id}`);
    return (await data.json()) ?? {};
  }

  protected housingSearch = {}

  submitApplication(firstName: string, lastName: string, email: string) {
    console.log(
      `Homes application received: firstName: ${firstName}, lastName: ${lastName}, email: ${email}.`,
    );
    this.housingSearch = {
      name: firstName + lastName,
      email: email
    }
  }
}


// function RollService($rootScope) {

//     this.activatedPlayer = 'p1';
//     this.players = {
//         'p1':{},
//         'p2':{}
//     }
//     this.activatedModel = {
//     }
//     this.targetModel = {
//     }
//     // // return {
//     //     // activatedModel:this.activatedModel,
//     //     // targetModel:this.targetModel,
//     // this.setActivatedModel = function(target){
//     //     console.log('setting target', target)
//     //     this.activatedModel = target 

//     // }

//     var that = this;

//      return {
//         subscribe: function(scope, callback) {
//             var handler = $rootScope.$on('notifying-service-event', callback);
//             scope.$on('$destroy', handler);
//         },
        
//         setRosta:function(player, playerData){
//             // console.log('player', player)
//             // console.log('this.palyers', that.players)
//             // console.log('this.as', that.activatedPlayer)
//             // console.log('playerData', playerData)
//             that.players[player].list = playerData;
//             console.log('hat',that.players)
//         },
//         getActivatedModel: function(target) {
            
//             return that.activatedModel;
//         },
//         // setAvailableTargets: function(rosta, player){
//         //     this.players[player] = rosta
//         // },
//         getAvailableTargets: function(activatedPlayer){
//             if(that.activatedPlayer == 'p1'){
//                 return that.players.p2.list;
//             }
//             if(that.activatedPlayer == 'p2'){
//                 return that.players.p1.list;
//             }
//         },
//         setActivatedModel: function(target, player) {
//             console.log('dsfljkdjlfs', target)
//             that.activatedPlayer = player;
//             that.activatedModel = target;
//             $rootScope.$emit('notifying-service-event');
//         }
//     };

// }

module.exports = RollService;
