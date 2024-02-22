import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RollOffComponent } from './roll-off.component';

describe('RollOffComponent', () => {
  let component: RollOffComponent;
  let fixture: ComponentFixture<RollOffComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [RollOffComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(RollOffComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
