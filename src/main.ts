/// <reference types="@angular/localize" />

import { bootstrapApplication } from '@angular/platform-browser';

import { provideRouter } from '@angular/router';

import { provideHttpClient, HttpClientModule, withFetch } from '@angular/common/http';

import { appConfig } from './app/app.config';
import { AppComponent } from './app/app.component';
import routeConfig from './app/routes';

/*
 *  Protractor support is deprecated in Angular.
 *  Protractor is used in this example for compatibility with Angular documentation tools.
 */

// Joe vs Jane instead of Joe and Jane vs the problem.

// import {bootstrapApplication, provideProtractorTestingSupport} from '@angular/platform-browser';
// bootstrapApplication(AppComponent, appConfig)
//   .catch((err) => console.error(err));

bootstrapApplication(AppComponent, {
  // providers: [provideProtractorTestingSupport(), provideRouter(routeConfig)],
  providers: [
    provideRouter(routeConfig), 
    provideHttpClient()
  ],
}).catch((err) => console.error(err));