
import 'package:flutter/material.dart';
import 'package:list_view_http_navigated/components/tarjeta_estudiante.dart';
import 'package:list_view_http_navigated/provider/list_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
          title: const Text('List App'),
          backgroundColor: const Color(0xFF5E9CA3),
        ),
        backgroundColor: const Color(0xFFAEC6CF),
        body: _body(),
        floatingActionButton: FloatingActionButton(
          onPressed: () { 
            Navigator.pushNamed(
              context, 
              '/selection');
           },),
        );
  }

  Widget _body(){
    return Column(
      children: [
        Flexible(child: _listaPersona())
      ],
    );
  }

  Widget _listaPersona() {
    var personasProvider = context.watch<ListProvider>();
    return FutureBuilder(
      builder: (BuildContext context, snapshot) {  
        if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.personas.length,
                itemBuilder: (BuildContext context, int index){
                  return TarjetaEstudiante(
                    idEstudiante: snapshot.data!.personas[index].idEstudiante, 
                    nombre: snapshot.data!.personas[index].nombre, 
                    apellidos: snapshot.data!.personas[index].apellidos, 
                    promedio: snapshot.data!.personas[index].promedio, 
                    carrera: snapshot.data!.personas[index].carrera,
                  );
                },
              );
            }else{
              return ListView(
                children: const [
                  Text(
                    'no data'
                  ),
                ],
              ); 
            }
      },
      future: personasProvider.list,
    );
  }

  







  
}
