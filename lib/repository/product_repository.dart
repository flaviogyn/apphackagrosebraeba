/*
import 'package:apphackagrosebraeba/entities/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductRepository {
  CollectionReference _collectionReference = FirebaseFirestore.instance.collection('Insumos');

  Future<List<Product>> getList(int masterCode) async {
    final snapshot = await _collectionReference.where('CodigoMs', isEqualTo: masterCode).get();

    if (snapshot.docs == null) return null;

    final data = snapshot.docs.map((e) => e.data()).toList();
    return Product.fromJsonArray(data);
  }
}
*/