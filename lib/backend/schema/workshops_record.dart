import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkshopsRecord extends FirestoreRecord {
  WorkshopsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Wname" field.
  String? _wname;
  String get wname => _wname ?? '';
  bool hasWname() => _wname != null;

  // "capacity" field.
  int? _capacity;
  int get capacity => _capacity ?? 0;
  bool hasCapacity() => _capacity != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "instructor" field.
  String? _instructor;
  String get instructor => _instructor ?? '';
  bool hasInstructor() => _instructor != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  bool hasTime() => _time != null;

  // "workshopID" field.
  int? _workshopID;
  int get workshopID => _workshopID ?? 0;
  bool hasWorkshopID() => _workshopID != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  void _initializeFields() {
    _wname = snapshotData['Wname'] as String?;
    _capacity = castToType<int>(snapshotData['capacity']);
    _date = snapshotData['date'] as String?;
    _description = snapshotData['description'] as String?;
    _instructor = snapshotData['instructor'] as String?;
    _location = snapshotData['location'] as String?;
    _price = castToType<int>(snapshotData['price']);
    _time = snapshotData['time'] as String?;
    _workshopID = castToType<int>(snapshotData['workshopID']);
    _img = snapshotData['img'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Workshops');

  static Stream<WorkshopsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkshopsRecord.fromSnapshot(s));

  static Future<WorkshopsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkshopsRecord.fromSnapshot(s));

  static WorkshopsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkshopsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkshopsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkshopsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkshopsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkshopsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkshopsRecordData({
  String? wname,
  int? capacity,
  String? date,
  String? description,
  String? instructor,
  String? location,
  int? price,
  String? time,
  int? workshopID,
  String? img,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Wname': wname,
      'capacity': capacity,
      'date': date,
      'description': description,
      'instructor': instructor,
      'location': location,
      'price': price,
      'time': time,
      'workshopID': workshopID,
      'img': img,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkshopsRecordDocumentEquality implements Equality<WorkshopsRecord> {
  const WorkshopsRecordDocumentEquality();

  @override
  bool equals(WorkshopsRecord? e1, WorkshopsRecord? e2) {
    return e1?.wname == e2?.wname &&
        e1?.capacity == e2?.capacity &&
        e1?.date == e2?.date &&
        e1?.description == e2?.description &&
        e1?.instructor == e2?.instructor &&
        e1?.location == e2?.location &&
        e1?.price == e2?.price &&
        e1?.time == e2?.time &&
        e1?.workshopID == e2?.workshopID &&
        e1?.img == e2?.img;
  }

  @override
  int hash(WorkshopsRecord? e) => const ListEquality().hash([
        e?.wname,
        e?.capacity,
        e?.date,
        e?.description,
        e?.instructor,
        e?.location,
        e?.price,
        e?.time,
        e?.workshopID,
        e?.img
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkshopsRecord;
}
