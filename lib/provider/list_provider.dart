import 'package:flutter/material.dart';
import 'package:list_view_http_navigated/models/persona.dart';
import 'package:list_view_http_navigated/services/personas_servicios.dart';

class ListProvider with ChangeNotifier{
  late Future<Personas> list;

  ListProvider() {
    load();    
  }

  load(){
    list =  PersonasServicios().obtenerTodos();
    notifyListeners();
  }
}