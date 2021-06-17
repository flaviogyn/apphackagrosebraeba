class Product {
  int id;
  String name;
  int masterCode;

  Product({
    this.id = 0,
    this.name,
    this.masterCode,
  });

  static Product fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return Product(
      id: json['CodigoDoProduto'],
      name: json['Produto'],
      masterCode: json['CodigoMs'],
    );
  }

  static Map<String, dynamic> toJson(Product entity) {
    if (entity == null) return null;

    return {
      'CodigoDoProduto': entity.id ?? 0,
      'Produto': entity.name,
      'CodigoMs': entity.masterCode,
    };
  }

  static List<Product> fromJsonArray(List<dynamic> jsonArray) {
    if (jsonArray == null) return null;

    return jsonArray.where((model) => model is Map<String, dynamic>).map((model) => fromJson(model)).toList(growable: false);
  }

  static List<Map<String, dynamic>> toJsonArray(List<Product> entities) {
    return entities?.map((entity) => toJson(entity))?.toList(growable: false);
  }

  @override
  String toString() => name;

  @override
  operator ==(o) => o is Product && o.id == id;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
