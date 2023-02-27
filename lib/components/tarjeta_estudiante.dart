import 'dart:math';
import 'package:flutter/material.dart';


Color getColor({double opa = 0.4}){
  Random rd = Random();
  return Color.fromRGBO(rd.nextInt(255), rd.nextInt(255), rd.nextInt(255), opa);
}

class TarjetaEstudiante extends StatefulWidget{
  final int idEstudiante;
  final String nombre;
  final String apellidos;
  final String carrera;
  final double promedio;

  const TarjetaEstudiante({super.key, 
  required this.idEstudiante, 
  required this.nombre, 
  required this.apellidos, 
  required this.promedio, 
  required this.carrera,
});

  @override
  State<StatefulWidget> createState() =>_TarjetaEstudiante();
  

}

class _TarjetaEstudiante extends State<TarjetaEstudiante>{
  final Color _color = const Color(0xFFD3D3D3);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 120,
        child: Center(
          child: 
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 5.0,
                )
              ]
            ),
            width: 360,
            height: 120,
            margin: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  //width: 120,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      color: _color,
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Photo(id: widget.idEstudiante.toString(),),
                  )
                ),
                Expanded(
                  flex: 2,
                  //width: 240,
                  child: Container(
                    decoration:  BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: _color,
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Info(title: 'Nombre completo', text: widget.nombre + widget.apellidos),
                          const Divider(height: 0.5, thickness: 1,),
                          Info(title: 'Carrera', text: widget.carrera.toString()),
                          const Divider(height: 0.5, thickness: 1,),
                          Info(title: 'Promedio', text: widget.promedio.toString()),
                        ],
                      ),
                    ),
                  )
                )
              ],
            ),
          ),
        )
    );
  }
}

class Photo extends StatelessWidget {
  const Photo({
    super.key, required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 4.0,
            offset: Offset(0.0, 0.75)
          )
        ],
        color: Color.fromARGB(255, 234, 234, 234),
      ),
      child: const ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        
      )
    );
  }
  
}


class Info extends StatelessWidget {
  const Info({
    super.key,
    required this.title,
    required this.text
  });

  final String title;
  final String text;
  
  @override
  Widget build(BuildContext context) {


    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(top: 6.0, left: 5.0),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 3.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold
                ),
              )
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 10
                ),
              )
            ),
          ],
        )
      )
    ); 
  }

}