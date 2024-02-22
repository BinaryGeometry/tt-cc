import { ApplicationConfig } from '@angular/core';
import { provideRouter, withViewTransitions } from '@angular/router';
import { routes } from 'app/app.routes';

export const appConfig: ApplicationConfig = {
  providers: [
    provideRouter(
      routes, // Your route configurations
      withViewTransitions() // Enable View Transition
    )
  ]
};
