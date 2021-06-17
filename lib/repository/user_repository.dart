/*
import 'package:apphackagrosebraeba/entities/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  CollectionReference _collectionReference = FirebaseFirestore.instance.collection('Operadores');

  Future<User> login(String username, String password) async {
    final snapshot = await _collectionReference.where('Operador', isEqualTo: username).where('Senha', isEqualTo: password).get();

    if (snapshot.docs == null) return null;
    if (snapshot.size != 1) return null;

    final data = snapshot.docs.first.data();
    return User.fromJson(data);
  }
}
*/