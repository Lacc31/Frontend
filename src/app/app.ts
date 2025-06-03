import { Component } from '@angular/core';
import {RouterLink, RouterOutlet} from '@angular/router';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet, RouterLink],
  templateUrl: './app.html',
  styleUrls: ['./app.css']  // ← CORREGIDO: "styleUrls" en plural y con []
})


export class App {
  protected integrante1 = 'Martin ';
  apeintegrante1= 'Salcedo';

}
