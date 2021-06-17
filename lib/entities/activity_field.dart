
/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmplus/core/entities/activity_field.dart';
import 'package:uuid/uuid.dart';

class ActivityFieldRepository {
  CollectionReference _collectionReference = FirebaseFirestore.instance.collection('AtividadesTalhoes');

  Future<List<ActivityField>> getActivityFieldList() async {
    final snapshot = await _collectionReference.get();

    if (snapshot.docs == null) return null;

    final data = snapshot.docs.map((e) => e.data()).toList();
    return ActivityField.fromJsonArray(data);
  }

  Future deleteActivityFieldListByActivity(String activityGuid) async {
    final snapshot = await _collectionReference.where('guidDaAtividade', isEqualTo: activityGuid).get();
    if (snapshot.docs == null) return null;
    for (var item in snapshot.docs) item.reference.delete();
  }

  Future<void> saveActivityField(ActivityField model) {
    var uuid = Uuid();
    final id = uuid.v1();

    final data = ActivityField.toJson(model);
    return _collectionReference.doc(id).set(data);
  }
}
*/