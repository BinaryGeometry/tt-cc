import {Component, Input} from '@angular/core';
import {FormGroup, ReactiveFormsModule} from '@angular/forms';
import {CommonModule} from '@angular/common';
import {QuestionBase} from './question-base';
@Component({
  standalone: true,
  selector: 'app-question',
  template:`	      
	<div [formGroup]="form">
	  <label [attr.for]="question.key">{{ question.label }}</label>
	  <div>
	    @switch (question.controlType) {
	      @case ('textbox') {
	        <input [formControlName]="question.key" [id]="question.key" [type]="question.type">
	      } @case ('dropdown') {
	        <select [id]="question.key" [formControlName]="question.key">
	        @for (opt of question.options; track opt) {
	          <option [value]="opt.key">{{ opt.value }}</option>
	        }
	        </select>
	      }
	    }
	  </div>
	  @if (!isValid) {<div class="errorMessage">{{ question.label }} is required</div>}
	</div>
  `,
  imports: [CommonModule, ReactiveFormsModule],
})
export class DynamicFormQuestionComponent {
  @Input() question!: QuestionBase<string>;
  @Input() form!: FormGroup;
  get isValid() {
    return this.form.controls[this.question.key].valid;
  }
}