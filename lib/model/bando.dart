import 'dart:convert';

class Bando {
  String descripcion;
  String titulo;
  String? id;

  Bando({
    required this.descripcion,
    required this.titulo,
  });

  get tituloBando {
    return titulo;
  }

  get descripcionBando {
    return descripcion;
  }

  factory Bando.fromJson(String str) => Bando.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Bando.fromMap(Map<String, dynamic> json) => Bando(
        descripcion: json["descripcion"],
        titulo: json["titulo"],
      );

  Map<String, dynamic> toMap() => {
        "descripcion": descripcion,
        "titulo": titulo,
      };
}
