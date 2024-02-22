import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NgbNavModule } from '@ng-bootstrap/ng-bootstrap';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-top-nav',
  standalone: true,
  imports: [CommonModule, RouterModule, NgbNavModule],
  template: `
    <nav class="navbar navbar-dark bg-dark">
      <a class="navbar-brand" href="#"><img class="brand-logo" src="/assets/logo.small.png" alt="logo" aria-hidden="true" /></a>
      <div  id="navbarNav">
        <ul ngbNav #nav="ngbNav"  class="nav-pills">
          @for (link of links; track link) {
            <li [ngbNavItem]="link.fragment">
              <a class="nav-item nav-link" ngbNavLink [routerLink]="[link.fragment]">{{link.title}}</a>
            </li>
          }
        </ul>
      </div>
    </nav>
  `,
  styleUrl: './top-nav.component.scss'
})
export class TopNavComponent {
    active = 1;
    links = [
      { title: 'Home', fragment: '/home' },
      { title: 'Leaderboard', fragment: '/leaderboard' },
      { title: 'Warband', fragment: '/warband' },
      { title: 'About', fragment: '/about' },
      { title: 'Pricing', fragment: '/pricing' },
    ];

    

    
}
