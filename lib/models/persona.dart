class Persona {
  Persona({
    required this.idEstudiante,
    required this.nombre,
    required this.apellidos,
    required this.carrera,
    required this.promedio,
  });

  final int idEstudiante;
  final String nombre;
  final String apellidos;
  final String carrera;
  final double promedio;

  factory Persona.fromJson(Map<String, dynamic> json){
    return Persona(
      idEstudiante: int.parse(json['id_estudiante'].toString()),
      nombre: json['nombre'],
      apellidos: json['apellidos'],
      promedio: double.parse(json['promedio'].toString()), 
      carrera: json['carrera'],
    );
  }
}

class Personas {
  Personas({required this.personas});

  final List<Persona> personas;

  factory Personas.fromJson(List<dynamic> json){
    List<Persona> lista = json.map((student) => Persona.fromJson(student)).toList();
    return Personas(personas: lista);
  }
}