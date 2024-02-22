import { Injectable } from '@angular/core';
import { Observable, throwError } from 'rxjs';
import { map } from 'rxjs/operators';
import { catchError } from 'rxjs/internal/operators/catchError';
import { HttpHeaders, HttpClient, HttpParams } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})

export class WebApiService {
  constructor(private httpClient: HttpClient) { }

  apiServerUrl = 'http://localhost:3000/';
  
  getSome(endpoint: string, endpointParams:any): Observable<any> {
    let params = new HttpParams();
    params = params.appendAll(endpointParams);

    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type':  'application/json',
        'Cache-Control' : 'no-cache',
        'Pragma' : 'no-cache'
      }),
      observe: "response" as 'body',
      params: params
    };
    
    const url = this.apiServerUrl+endpoint;

    return this.httpClient.get(
      url,
      httpOptions
    )
    .pipe(
        map((response: any) => this.ReturnResponseData(response)),
        catchError(this.handleError)
    );
  }

  getOne(endpoint: string, endpointId: number, endpointParams:any): Observable<any> {
    let params = new HttpParams();
    params = params.appendAll(endpointParams);

    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type':  'application/json',
        'Cache-Control' : 'no-cache',
        'Pragma' : 'no-cache'
      }),
      observe: "response" as 'body',
      params: params
    };
    
    const url = this.apiServerUrl+endpoint+'/'+endpointId;

    return this.httpClient.get(
      url,
      httpOptions
    )
    .pipe(
        map((response: any) => this.ReturnResponseData(response)),
        catchError(this.handleError)
    );
  }

  // Post call method 
  // Param 1 : url
  // Param 2 : model
  post(endpoint: string, model: any): Observable<any> {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type': 'application/json'
      }), 
      observe: "response" as 'body'
    };

    const url = this.apiServerUrl+endpoint;

    return this.httpClient.post(
      url,
      model,
      httpOptions)
      .pipe(
        map((response: any) => {
          console.log('what is the response', response)
          this.ReturnResponseData(response)
        }),
        catchError(this.handleError)
      
    );
  }
  
  private ReturnResponseData(response: any) {
    return response.body;
  }
  
  private handleError(error: any) {
    return throwError(error);
  }
}