import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class SkillGapService {
  // Use the port shown in your terminal (5181)
  private apiUrl = 'http://localhost:5181/api/Roles';

  constructor(private http: HttpClient) { }

  // This is for your GET request (to list roles)
  getRoles(): Observable<any> {
    return this.http.get(this.apiUrl);
  }

  // This is for your POST request (to analyze skills)
  analyzeGap(data: any): Observable<any> {
    // Note the '/analyze' at the end to match your Swagger UI
    return this.http.post(`${this.apiUrl}/analyze`, data);
  }
}
