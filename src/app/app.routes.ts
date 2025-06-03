// @ts-ignore

import { Routes } from '@angular/router';
import {Registro} from './registro/registro';
import {Home} from './home/home';
import {About} from './about/about';
import {Curso} from './curso/curso';
import {Component} from '@angular/core';

export const routes: Routes = [
  {path:'',component: Home},
  {path:'nosotros', component: About},
  {path:'curso', component: Curso},
  {path:'registro',component:Registro},
  {path:'**',component:Home}
];


