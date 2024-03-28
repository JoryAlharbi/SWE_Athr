import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviewsRecord extends FirestoreRecord {
  ReviewsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  // "workshopID" field.
  DocumentReference? _workshopID;
  DocumentReference? get workshopID => _workshopID;
  bool hasWorkshopID() => _workshopID != null;

  // "starCount" field.
  int? _starCount;
  int get starCount => _starCount ?? 0;
  bool hasStarCount() => _starCount != null;

  void _initializeFields() {
    _userID = snapshotData['userID'] as DocumentReference?;
    _workshopID = snapshotData['workshopID'] as DocumentReference?;
    _starCount = castToType<int>(snapshotData['starCount']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reviews');

  static Stream<ReviewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReviewsRecord.fromSnapshot(s));

  static Future<ReviewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReviewsRecord.fromSnapshot(s));

  static ReviewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReviewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReviewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReviewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReviewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReviewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReviewsRecordData({
  DocumentReference? userID,
  DocumentReference? workshopID,
  int? starCount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userID': userID,
      'workshopID': workshopID,
      'starCount': starCount,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReviewsRecordDocumentEquality implements Equality<ReviewsRecord> {
  const ReviewsRecordDocumentEquality();

  @override
  bool equals(ReviewsRecord? e1, ReviewsRecord? e2) {
    return e1?.userID == e2?.userID &&
        e1?.workshopID == e2?.workshopID &&
        e1?.starCount == e2?.starCount;
  }

  @override
  int hash(ReviewsRecord? e) =>
      const ListEquality().hash([e?.userID, e?.workshopID, e?.starCount]);

  @override
  bool isValidKey(Object? o) => o is ReviewsRecord;
}
