import { Injectable } from '@angular/core';
import { DropdownQuestion } from './question-dropdown';
import { QuestionBase } from './question-base';
import { TextboxQuestion } from './question-textbox';
import { Observable, BehaviorSubject, ReplaySubject, of } from 'rxjs';

import {WebApiService} from 'app/web-api.service';

@Injectable()
export class QuestionService {

  private _questions = new BehaviorSubject<QuestionBase<string>[]>([]);
  private _questions$ = this._questions.asObservable();

  constructor(private webApiService: WebApiService) { }

  getQuestions(): Observable<QuestionBase<string>[]> {
    return this._questions$;
  }

  fetchQuestions()  {

    const questions: QuestionBase<string>[] = [];

    this.webApiService.getSome('questions', {}).subscribe((results) => {
      results.forEach((row:any) => {
        switch(row.fieldType) { 
           case 'DropdownQuestion': { 
              questions.push(new DropdownQuestion(row));
              break; 
           } 
           case 'TextboxQuestion': { 
              questions.push(new TextboxQuestion(row));
              break; 
           } 
           default: { 
              break; 
           } 
        } 
      });

      return this._questions.next(questions);

    });

  }
}
