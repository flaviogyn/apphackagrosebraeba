class User {
  int id;
  String username;
  String password;
  int masterCode;

  User({
    this.id = 0,
    this.username,
    this.password,
    this.masterCode,
  });

  static User fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return User(
      id: json['Id'],
      username: json['Operador'],
      password: json['Senha'],
      masterCode: json['CodigoMs'],
    );
  }

  static Map<String, dynamic> toJson(User entity) {
    if (entity == null) return null;

    return {
      'Id': entity.id ?? 0,
      'Operador': entity.username,
      'Senha': entity.password,
      'CodigoMs': entity.masterCode,
    };
  }

  static List<User> fromJsonArray(List<dynamic> jsonArray) {
    if (jsonArray == null) return null;

    return jsonArray.where((model) => model is Map<String, dynamic>).map((model) => fromJson(model)).toList(growable: false);
  }

  static List<Map<String, dynamic>> toJsonArray(List<User> entities) {
    return entities?.map((entity) => toJson(entity))?.toList(growable: false);
  }
}
