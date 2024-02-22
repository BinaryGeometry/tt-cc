import { Component, inject } from '@angular/core';
import { CommonModule } from '@angular/common';

import {HousingLocationComponent} from 'app/housing-location/housing-location.component';
import {HousingLocation} from 'app/housinglocation';
import {HousingService} from 'app/housing.service';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [CommonModule, HousingLocationComponent],
  // templateUrl: './home.component.html',
  template: `
  <div class="content">
    <div class="h-100 p-5 text-white bg-dark rounded-3" style="margin:20px;">
      <h2 class="display-3">Find Opponents!</h2>
      <form>
        <input type="text" placeholder="Filter by city" #filter>
        <button class="primary" type="button" (click)="filterResults(filter.value)">Search</button>
      </form>
    </div>
    
      <section class="results">
        <app-housing-location
          *ngFor="let housingLocation of filteredLocationList"
          [housingLocation]="housingLocation"
        ></app-housing-location>
      </section>
  </div>
  `,
  styleUrl: './home.component.scss'
})
export class HomeComponent {
  housingLocationList: HousingLocation[] = [];
  housingService: HousingService = inject(HousingService);

  filteredLocationList: HousingLocation[] = [];

  constructor() {
    this.housingService.getAllHousingLocations().then((housingLocationList: HousingLocation[]) => {
      this.housingLocationList = housingLocationList;
      this.filteredLocationList = housingLocationList;
    });
  }
  filterResults(text: string) {
    if (!text) {
      this.filteredLocationList = this.housingLocationList;
    }
    this.filteredLocationList = this.housingLocationList.filter((housingLocation) =>
      housingLocation?.city.toLowerCase().includes(text.toLowerCase()),
    );
  }
}
