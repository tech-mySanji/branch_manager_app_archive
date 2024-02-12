import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeliveryAgentsRecord extends FirestoreRecord {
  DeliveryAgentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "delivery_agent_name" field.
  String? _deliveryAgentName;
  String get deliveryAgentName => _deliveryAgentName ?? '';
  bool hasDeliveryAgentName() => _deliveryAgentName != null;

  // "aadhar_number" field.
  String? _aadharNumber;
  String get aadharNumber => _aadharNumber ?? '';
  bool hasAadharNumber() => _aadharNumber != null;

  // "license_number" field.
  String? _licenseNumber;
  String get licenseNumber => _licenseNumber ?? '';
  bool hasLicenseNumber() => _licenseNumber != null;

  // "id_proof_image" field.
  String? _idProofImage;
  String get idProofImage => _idProofImage ?? '';
  bool hasIdProofImage() => _idProofImage != null;

  // "license_image" field.
  String? _licenseImage;
  String get licenseImage => _licenseImage ?? '';
  bool hasLicenseImage() => _licenseImage != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "cash_balance" field.
  double? _cashBalance;
  double get cashBalance => _cashBalance ?? 0.0;
  bool hasCashBalance() => _cashBalance != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _address = snapshotData['address'] as String?;
    _email = snapshotData['email'] as String?;
    _uid = snapshotData['uid'] as String?;
    _deliveryAgentName = snapshotData['delivery_agent_name'] as String?;
    _aadharNumber = snapshotData['aadhar_number'] as String?;
    _licenseNumber = snapshotData['license_number'] as String?;
    _idProofImage = snapshotData['id_proof_image'] as String?;
    _licenseImage = snapshotData['license_image'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _cashBalance = castToType<double>(snapshotData['cash_balance']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('delivery_agents')
          : FirebaseFirestore.instance.collectionGroup('delivery_agents');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('delivery_agents').doc(id);

  static Stream<DeliveryAgentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DeliveryAgentsRecord.fromSnapshot(s));

  static Future<DeliveryAgentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DeliveryAgentsRecord.fromSnapshot(s));

  static DeliveryAgentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DeliveryAgentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DeliveryAgentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DeliveryAgentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DeliveryAgentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DeliveryAgentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDeliveryAgentsRecordData({
  String? address,
  String? email,
  String? uid,
  String? deliveryAgentName,
  String? aadharNumber,
  String? licenseNumber,
  String? idProofImage,
  String? licenseImage,
  String? phoneNumber,
  double? cashBalance,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'address': address,
      'email': email,
      'uid': uid,
      'delivery_agent_name': deliveryAgentName,
      'aadhar_number': aadharNumber,
      'license_number': licenseNumber,
      'id_proof_image': idProofImage,
      'license_image': licenseImage,
      'phone_number': phoneNumber,
      'cash_balance': cashBalance,
    }.withoutNulls,
  );

  return firestoreData;
}

class DeliveryAgentsRecordDocumentEquality
    implements Equality<DeliveryAgentsRecord> {
  const DeliveryAgentsRecordDocumentEquality();

  @override
  bool equals(DeliveryAgentsRecord? e1, DeliveryAgentsRecord? e2) {
    return e1?.address == e2?.address &&
        e1?.email == e2?.email &&
        e1?.uid == e2?.uid &&
        e1?.deliveryAgentName == e2?.deliveryAgentName &&
        e1?.aadharNumber == e2?.aadharNumber &&
        e1?.licenseNumber == e2?.licenseNumber &&
        e1?.idProofImage == e2?.idProofImage &&
        e1?.licenseImage == e2?.licenseImage &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.cashBalance == e2?.cashBalance;
  }

  @override
  int hash(DeliveryAgentsRecord? e) => const ListEquality().hash([
        e?.address,
        e?.email,
        e?.uid,
        e?.deliveryAgentName,
        e?.aadharNumber,
        e?.licenseNumber,
        e?.idProofImage,
        e?.licenseImage,
        e?.phoneNumber,
        e?.cashBalance
      ]);

  @override
  bool isValidKey(Object? o) => o is DeliveryAgentsRecord;
}
