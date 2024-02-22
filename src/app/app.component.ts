import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterOutlet } from '@angular/router';
import { RouterModule } from '@angular/router';

import { NgbConfig } from '@ng-bootstrap/ng-bootstrap';



import { HomeComponent } from 'app/home/home.component';
import { TopNavComponent } from 'app/top-nav/top-nav.component';


@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule, RouterOutlet, RouterModule, HomeComponent, TopNavComponent],
  //templateUrl: './app.component.html',

  template: `
    <header>
      <app-top-nav></app-top-nav>
    </header>

    <main role="main" class="container-fluid main-outlet" >
      <router-outlet></router-outlet>
    </main>
    
    <footer class="footer">
      <div class="container">
        
        <span class="text-muted">
          <img src="/assets/logo.png" style="height:50px;"/>
        </span>

      </div>
    </footer>
  `,
  styleUrl: './app.component.scss'
})

export class AppComponent {
  title = 'Atelier';

  constructor(ngbConfig: NgbConfig) {
    ngbConfig.animation = false;
  }
}
