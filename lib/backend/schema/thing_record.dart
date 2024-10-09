import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ThingRecord extends FirestoreRecord {
  ThingRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "company" field.
  DocumentReference? _company;
  DocumentReference? get company => _company;
  bool hasCompany() => _company != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _company = snapshotData['company'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _price = castToType<double>(snapshotData['price']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('thing')
          : FirebaseFirestore.instance.collectionGroup('thing');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('thing').doc(id);

  static Stream<ThingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ThingRecord.fromSnapshot(s));

  static Future<ThingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ThingRecord.fromSnapshot(s));

  static ThingRecord fromSnapshot(DocumentSnapshot snapshot) => ThingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ThingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ThingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ThingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ThingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createThingRecordData({
  DocumentReference? company,
  String? name,
  double? price,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'company': company,
      'name': name,
      'price': price,
    }.withoutNulls,
  );

  return firestoreData;
}

class ThingRecordDocumentEquality implements Equality<ThingRecord> {
  const ThingRecordDocumentEquality();

  @override
  bool equals(ThingRecord? e1, ThingRecord? e2) {
    return e1?.company == e2?.company &&
        e1?.name == e2?.name &&
        e1?.price == e2?.price;
  }

  @override
  int hash(ThingRecord? e) =>
      const ListEquality().hash([e?.company, e?.name, e?.price]);

  @override
  bool isValidKey(Object? o) => o is ThingRecord;
}
