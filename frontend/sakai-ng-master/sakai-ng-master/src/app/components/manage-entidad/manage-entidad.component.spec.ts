import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageEntidadComponent } from './manage-entidad.component';

describe('ManageEntidadComponent', () => {
  let component: ManageEntidadComponent;
  let fixture: ComponentFixture<ManageEntidadComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ManageEntidadComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(ManageEntidadComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
