import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_view_http_navigated/pages/add_student.dart';

class SelectionPage extends StatefulWidget{
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
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
            Navigator.pop(context);
           },),
        );
  }

  Widget _body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _lottie(),
          _options()
        ],
      ),
    );
  }

  Widget _lottie() {
    return Image.network(
      'https://ruta/a/la/imagen.png',
      width: 200,
      height: 200,
      fit: BoxFit.cover,
    );
  }

  Widget _options() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: ()=>{
            Get.to(FormPage())
          }, 
          child: const Text('Eliminar')),
          ElevatedButton(
            onPressed: ()=>{
              Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context) => FormPage()))
            }, 
            child: const Text('Agregar'))
      ],
    );
  }
}
