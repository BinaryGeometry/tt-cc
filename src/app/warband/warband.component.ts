import { Component, inject, OnInit  } from '@angular/core';
import {CommonModule, AsyncPipe} from '@angular/common';
import {DynamicFormComponent} from '../dyno-form/dynamic-form.component';
import {QuestionService} from '../dyno-form/question.service';
import {QuestionBase} from '../dyno-form/question-base';
import {Observable} from 'rxjs';

@Component({
  selector: 'app-warband',
  standalone: true,
  providers: [QuestionService],
  imports: [CommonModule, AsyncPipe, DynamicFormComponent],
  template: `
    <div>
      <article *ngIf="questions.length > 0">
        <h2>Build your feature</h2>
        <app-dynamic-form [questions]="questions"></app-dynamic-form>
      </article>
    </div>
  `,
  styleUrl: './warband.component.scss'
})
export class WarbandComponent implements OnInit {
  questions: QuestionBase<string>[] = [];
  
  constructor(public questionService: QuestionService) {}

  ngOnInit(): void {

    this.questionService.fetchQuestions();

    this.questionService.getQuestions().subscribe((questionBase: QuestionBase<string>[]) => {
      
      console.log('resturn', questionBase)

      this.questions = questionBase;
    });
  }


}
