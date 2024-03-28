import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userID" field.
  int? _userID;
  int get userID => _userID ?? 0;
  bool hasUserID() => _userID != null;

  // "PhoneNum" field.
  int? _phoneNum;
  int get phoneNum => _phoneNum ?? 0;
  bool hasPhoneNum() => _phoneNum != null;

  // "fullName" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  bool hasFullName() => _fullName != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "Profile_Photo" field.
  String? _profilePhoto;
  String get profilePhoto => _profilePhoto ?? '';
  bool hasProfilePhoto() => _profilePhoto != null;

  void _initializeFields() {
    _userID = castToType<int>(snapshotData['userID']);
    _phoneNum = castToType<int>(snapshotData['PhoneNum']);
    _fullName = snapshotData['fullName'] as String?;
    _location = snapshotData['location'] as String?;
    _password = snapshotData['password'] as String?;
    _email = snapshotData['email'] as String?;
    _profilePhoto = snapshotData['Profile_Photo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  int? userID,
  int? phoneNum,
  String? fullName,
  String? location,
  String? password,
  String? email,
  String? profilePhoto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userID': userID,
      'PhoneNum': phoneNum,
      'fullName': fullName,
      'location': location,
      'password': password,
      'email': email,
      'Profile_Photo': profilePhoto,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.userID == e2?.userID &&
        e1?.phoneNum == e2?.phoneNum &&
        e1?.fullName == e2?.fullName &&
        e1?.location == e2?.location &&
        e1?.password == e2?.password &&
        e1?.email == e2?.email &&
        e1?.profilePhoto == e2?.profilePhoto;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.userID,
        e?.phoneNum,
        e?.fullName,
        e?.location,
        e?.password,
        e?.email,
        e?.profilePhoto
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
