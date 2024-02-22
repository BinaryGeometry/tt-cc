import { ComponentFixture, TestBed } from '@angular/core/testing';

import { WarbandComponent } from './warband.component';

describe('WarbandComponent', () => {
  let component: WarbandComponent;
  let fixture: ComponentFixture<WarbandComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [WarbandComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(WarbandComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
