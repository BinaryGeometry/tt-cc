import { Injectable } from '@angular/core';

import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class ApiService {

  constructor(private http: HttpClient, private params: HttpParams) {}

  apiServerUrl = 'http://localhost:3000/';

  async getData(endpoint:string, endpointParams:any): Promise<any> {

    let getParams = this.params.appendAll(endpointParams);

	return this.http.get(this.apiServerUrl+endpoint, {
		params: getParams
	}).toPromise();

  }

}
