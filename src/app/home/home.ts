import { Component } from '@angular/core';

@Component({
  selector: 'app-home',
  imports: [],
  templateUrl: './home.html',
  styleUrl: './home.css'
})
export class Home {
  message: string = 'Esperando llamada a la API...';

  useApi() {
    fetch('http://3.142.238.189:8080/test')
      .then(response => response.text()) // Obtiene el texto de la respuesta
      .then(text => this.message = text) // Asignar el texto obtenido a la variable message
      .catch(error => {
        // Captura cualquier error en la llamada a la API
        console.error('Error fetching data:', error);
        this.message = 'Error fetching data';
      });
  }
}
