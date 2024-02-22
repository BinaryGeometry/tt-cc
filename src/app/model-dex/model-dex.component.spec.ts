import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ModelDexComponent } from './model-dex.component';

describe('ModelDexComponent', () => {
  let component: ModelDexComponent;
  let fixture: ComponentFixture<ModelDexComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ModelDexComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(ModelDexComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
