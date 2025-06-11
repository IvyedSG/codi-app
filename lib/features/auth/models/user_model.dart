class User {
  final String id;
  final String nombre;
  final String correo;

  User({
    required this.id,
    required this.nombre,
    required this.correo,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      nombre: json['nombre'] ?? '',
      correo: json['correo'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'correo': correo,
    };
  }
}