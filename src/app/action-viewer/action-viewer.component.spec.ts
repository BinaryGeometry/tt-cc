import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ActionViewerComponent } from './action-viewer.component';

describe('ActionViewerComponent', () => {
  let component: ActionViewerComponent;
  let fixture: ComponentFixture<ActionViewerComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ActionViewerComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(ActionViewerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
