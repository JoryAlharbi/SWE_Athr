import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class PostsRecord extends FirestoreRecord {
  PostsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "postDate" field.
  String? _postDate;
  String get postDate => _postDate ?? '';
  bool hasPostDate() => _postDate != null;

  // "userID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  // "workshopID" field.
  DocumentReference? _workshopID;
  DocumentReference? get workshopID => _workshopID;
  bool hasWorkshopID() => _workshopID != null;

  void _initializeFields() {
    _content = snapshotData['content'] as String?;
    _img = snapshotData['img'] as String?;
    _postDate = snapshotData['postDate'] as String?;
    _userID = snapshotData['userID'] as DocumentReference?;
    _workshopID = snapshotData['workshopID'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostsRecord.fromSnapshot(s));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostsRecord.fromSnapshot(s));

  static PostsRecord fromSnapshot(DocumentSnapshot snapshot) => PostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostsRecordData({
  String? content,
  String? img,
  String? postDate,
  DocumentReference? userID,
  DocumentReference? workshopID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'content': content,
      'img': img,
      'postDate': postDate,
      'userID': userID,
      'workshopID': workshopID,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostsRecordDocumentEquality implements Equality<PostsRecord> {
  const PostsRecordDocumentEquality();

  @override
  bool equals(PostsRecord? e1, PostsRecord? e2) {
    return e1?.content == e2?.content &&
        e1?.img == e2?.img &&
        e1?.postDate == e2?.postDate &&
        e1?.userID == e2?.userID &&
        e1?.workshopID == e2?.workshopID;
  }

  @override
  int hash(PostsRecord? e) => const ListEquality()
      .hash([e?.content, e?.img, e?.postDate, e?.userID, e?.workshopID]);

  @override
  bool isValidKey(Object? o) => o is PostsRecord;
}
