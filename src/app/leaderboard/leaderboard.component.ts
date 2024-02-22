import { Component } from '@angular/core';
import { AgGridModule } from 'ag-grid-angular'; // Angular Grid Logic
import { ColDef } from 'ag-grid-community'; // Column Definitions Interface

@Component({
  selector: 'app-leaderboard',
  standalone: true,
  imports: [AgGridModule],
  template: `
    <ag-grid-angular
    style="height: 500px;"
    class="ag-theme-quartz"
      [rowData]="rowData"
      [columnDefs]="colDefs">
    </ag-grid-angular>
  `,
  styleUrl: './leaderboard.component.scss'
})
export class LeaderboardComponent {
  
  rowData: any[] = [
    { mission: "Voyager", company: "NASA", location: "Cape Canaveral", date: "1977-09-05", rocket: "Titan-Centaur ", price: 86580000, successful: true },
    { mission: "Apollo 13", company: "NASA", location: "Kennedy Space Center", date: "1970-04-11", rocket: "Saturn V", price: 3750000, successful: false },
    { mission: "Falcon 9", company: "SpaceX", location: "Cape Canaveral", date: "2015-12-22", rocket: "Falcon 9", price: 9750000, successful: true }
  ];

  // Column Definitions: Defines & controls grid columns.
  colDefs: ColDef[] = [
    { field: "mission" },
    { field: "company" },
    { field: "location" },
    { field: "date" },
    { field: "price" },
    { field: "successful" },
    { field: "rocket" }
  ];

  constructor() {
  }
    // this.housingService.getAllHousingLocations().then((housingLocationList: HousingLocation[]) => {
      // this.colDefs = colDefs;
      // this.rowData = rowData;
    // });
}
