import { Component, Input } from '@angular/core';
import { CommonModule } from '@angular/common';

import { NgbAccordionModule } from '@ng-bootstrap/ng-bootstrap';
import {BattleRoundService} from 'app/battle-round.service';
import {WebApiService} from 'app/web-api.service';
import { Model } from 'types/model';

@Component({
  selector: 'app-model-dex',
  standalone: true,
  imports: [CommonModule, NgbAccordionModule],
  template:`
  <div class="burrow-box">

    <nav class="model-counter"
    ng-class="{'activated':ViewCtrl.activatedPlayer == 'p1'}"
    >
        @for (model of roster; track model.id) {
          <button class="model-thumb" 
          (click)="battleRoundService.activateModel(model, playerId)"
          ng-class="{
            'used':model.activatedState == 'used',
            'available':model.activatedState == 'available',
            'activated':model.activatedState =='activated'
          }">
            <img [src]="model.image">
          </button>
        }
    </nav>
    <div class="accordion" id="accordionExample">
      <div ngbAccordion>
        @for (model of roster; track model.id) {
          <div ngbAccordionItem>
            <h2 ngbAccordionHeader>
              <button ngbAccordionButton>
                <img class="gameboard model-image" [src]="model.image">
                <span class="model-name">{{model.name}}</span>
              </button>
            </h2>
            <div ngbAccordionCollapse>
              <div ngbAccordionBody>
                <ng-template>
                  <div class="accordion-body">
                    <div class="row">
                        <div class="col-md-12">
                            <p>{{model.size}} {{model.species}}</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <span class="stat-name">[M]</span><span class="stat-value">{{model.m}}</span>
                            <span class="stat-name">[S]</span><span class="stat-value">{{model.s}}</span>
                            <span class="stat-name">[B]</span><span class="stat-value">{{model.b}}</span>
                        </div>
                        <div class="col-md-4">
                            <span class="stat-name">[R]</span><span class="stat-value">{{model.r}}</span>
                            <span class="stat-name">[N]</span><span class="stat-value">{{model.n}}</span>
                            <span class="stat-name">[C]</span><span class="stat-value">{{model.c}}</span>
                        </div>

                        <div class="col-md-4">
                            <span class="stat-name">[A]</span><span class="stat-value">{{model.a}}</span>
                            <span class="stat-name">[F]</span><span class="stat-value">{{model.f}}</span>
                            <span class="stat-name">[P]</span><span class="stat-value">{{model.p}}</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <span class="weapon-name">Weapon 1</span><span class="weapon-value">{{model.weapon_one_description}}</span>
                        </div>
                        <div class="col-md-12">
                            <span class="weapon-name">Weapon 2</span><span class="weapon-value">{{model.weapon_two_description}}</span>
                        </div>
                        <div class="col-md-12">
                            <span class="weapon-name">Armour 1</span><span class="weapon-value">{{model.armour_one_description}}</span>
                        </div>
                        <div class="col-md-12">
                            <span class="weapon-name">Armour 2</span><span class="weapon-value">{{model.armour_two_description}}</span>
                        </div>
                    </div>
                  </div>
                </ng-template>
              </div>
            </div>
          </div>
        }
      </div>
    </div>
  </div>
  `,
  styleUrl: './model-dex.component.scss'
})
export class ModelDexComponent {

  @Input() roster!: Model[]; 
  @Input() playerId!: number; 

  warbandData: any[] = [];

  constructor(private webApiService: WebApiService, public battleRoundService: BattleRoundService) {}

  // ngOnInit(): void {
  //   this.getWarband();
  // }

  // async getWarband() {
  //   console.log('getting game')
  //   this.webApiService.getSome('models', {warband_id: this.warbandId}).subscribe((data : any) => {
  //     if (data != null) {
  //       var resultData = data;
  //       if (resultData) {
  //         this.warbandData = resultData;
  //       }
  //     }
  //   },
  //   (error : any)=> {
  //       if (error) {
  //         if (error.status == 404) {
  //           if(error.error && error.error.message){
  //             this.warbandData = [];
  //           }
  //         }
  //       }
  //     });
  // }

}


// BaseEngine.directive('modelDex', function($compile) {
//     return {
//         restrict: 'E',
//         replace:true,
//         scope:{
//             list:'=',
//             player:'=',
//             gameState:'=',
//             gameCounter:'='
//         },
//             // <pre ng-bind="ViewCtrl.gameState"></pre>
//         template:`

//         `,
//         controllerAs:'ViewCtrl',
//         controller:function($scope, EngineFactory, RollService){
//             let vm = this;
//             vm.player = $scope.player;
//             vm.gameState = $scope.gameState;
//             console.log(vm.gameState);
//             let list = [];
//             for (var i = $scope.list.length - 1; i >= 0; i--) {
//                 list[i] = $scope.list[i]
//                 list[i].toggle = "hide"
//             }
//             vm.list = list;
//             $scope.$watch('gameState', function(ov, nv){
//                 console.log('gameState change', $scope.gameState);
//                 vm.gameState = $scope.gameState;
//             });
//             RollService.setRosta(vm.player, vm.list);
//             vm.toggle = function(target){
//                 console.log('target',target)
//                 for (var i = vm.list.length - 1; i >= 0; i--) {
//                     vm.list[i].toggle = "hide";
//                 }
//                 if(target.toggle != "show"){
//                     target.toggle = "show"
//                     RollService.setActivatedModel(target, vm.player);
//                 } else {
//                     target.toggle = "hide"
//                 }
//             }
//         },
//     }
// });
