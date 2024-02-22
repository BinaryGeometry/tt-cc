import {Routes} from '@angular/router';

import {HomeComponent} from 'app/home/home.component';
import {DetailsComponent} from 'app/details/details.component';
import {AboutComponent} from 'app/about/about.component';
import {WarbandComponent} from 'app/warband/warband.component';
import {LeaderboardComponent} from 'app/leaderboard/leaderboard.component';
import {PricingComponent} from 'app/pricing/pricing.component';
import {RollOffComponent} from 'app/roll-off/roll-off.component';

const routeConfig: Routes = [
  {
    path: 'home',
    component: RollOffComponent,
    title: 'Home',
  },
  {
    path: 'leaderboard',
    component: LeaderboardComponent,
    title: 'Leaderboard',
  },
  {
    path: 'about',
    component: AboutComponent,
    title: 'About',
  },
  {
    path: 'pricing',
    component: PricingComponent,
    title: 'About',
  },
  {
    path: 'warband',
    component: WarbandComponent,
    title: 'Warband',
  },
  {
    path: 'details/:id',
    component: DetailsComponent,
    title: 'Home details',
  },
];

export default routeConfig;