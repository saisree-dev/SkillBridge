import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { SkillGapService } from './services/skill-gap.service';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  selectedRole: string = '';
  availableSkills: string[] = ["HTML", "CSS", "JavaScript", "React", "Node.js", "DSA", "C", "Microcontrollers"];
  userSkills: { [key: string]: boolean } = {};
  result: any = null;

  constructor(private skillService: SkillGapService) {}

  analyze() {
    if (!this.selectedRole) {
      alert("Please select a role.");
      return;
    }

    const checkedSkills = Object.keys(this.userSkills).filter(skill => this.userSkills[skill]);
    
    this.skillService.analyzeGap({ roles: this.selectedRole, skill: checkedSkills })
      .subscribe({
        next: (response) => this.result = response,
        error: (err) => console.error("Connection failed. Is the .NET API running?", err)
      });
  }
}
