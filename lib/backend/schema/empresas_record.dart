import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmpresasRecord extends FirestoreRecord {
  EmpresasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  void _initializeFields() {}

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('empresas');

  static Stream<EmpresasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EmpresasRecord.fromSnapshot(s));

  static Future<EmpresasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EmpresasRecord.fromSnapshot(s));

  static EmpresasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EmpresasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EmpresasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EmpresasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EmpresasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EmpresasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEmpresasRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class EmpresasRecordDocumentEquality implements Equality<EmpresasRecord> {
  const EmpresasRecordDocumentEquality();

  @override
  bool equals(EmpresasRecord? e1, EmpresasRecord? e2) {
    return;
  }

  @override
  int hash(EmpresasRecord? e) => const ListEquality().hash([]);

  @override
  bool isValidKey(Object? o) => o is EmpresasRecord;
}
