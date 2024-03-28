import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ReservationsRecord extends FirestoreRecord {
  ReservationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "reservationID" field.
  String? _reservationID;
  String get reservationID => _reservationID ?? '';
  bool hasReservationID() => _reservationID != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  bool hasTime() => _time != null;

  // "userID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  // "workshopID" field.
  DocumentReference? _workshopID;
  DocumentReference? get workshopID => _workshopID;
  bool hasWorkshopID() => _workshopID != null;

  void _initializeFields() {
    _date = snapshotData['Date'] as String?;
    _reservationID = snapshotData['reservationID'] as String?;
    _time = snapshotData['time'] as String?;
    _userID = snapshotData['userID'] as DocumentReference?;
    _workshopID = snapshotData['workshopID'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Reservations');

  static Stream<ReservationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReservationsRecord.fromSnapshot(s));

  static Future<ReservationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReservationsRecord.fromSnapshot(s));

  static ReservationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReservationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReservationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReservationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReservationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReservationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReservationsRecordData({
  String? date,
  String? reservationID,
  String? time,
  DocumentReference? userID,
  DocumentReference? workshopID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Date': date,
      'reservationID': reservationID,
      'time': time,
      'userID': userID,
      'workshopID': workshopID,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReservationsRecordDocumentEquality
    implements Equality<ReservationsRecord> {
  const ReservationsRecordDocumentEquality();

  @override
  bool equals(ReservationsRecord? e1, ReservationsRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.reservationID == e2?.reservationID &&
        e1?.time == e2?.time &&
        e1?.userID == e2?.userID &&
        e1?.workshopID == e2?.workshopID;
  }

  @override
  int hash(ReservationsRecord? e) => const ListEquality()
      .hash([e?.date, e?.reservationID, e?.time, e?.userID, e?.workshopID]);

  @override
  bool isValidKey(Object? o) => o is ReservationsRecord;
}
