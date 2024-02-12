import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CashBookRecord extends FirestoreRecord {
  CashBookRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "transactionId" field.
  String? _transactionId;
  String get transactionId => _transactionId ?? '';
  bool hasTransactionId() => _transactionId != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "customerName" field.
  String? _customerName;
  String get customerName => _customerName ?? '';
  bool hasCustomerName() => _customerName != null;

  // "shopName" field.
  String? _shopName;
  String get shopName => _shopName ?? '';
  bool hasShopName() => _shopName != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "transactionTime" field.
  DateTime? _transactionTime;
  DateTime? get transactionTime => _transactionTime;
  bool hasTransactionTime() => _transactionTime != null;

  // "transactionType" field.
  String? _transactionType;
  String get transactionType => _transactionType ?? '';
  bool hasTransactionType() => _transactionType != null;

  // "deliveryAgentId" field.
  String? _deliveryAgentId;
  String get deliveryAgentId => _deliveryAgentId ?? '';
  bool hasDeliveryAgentId() => _deliveryAgentId != null;

  // "runningBalance" field.
  double? _runningBalance;
  double get runningBalance => _runningBalance ?? 0.0;
  bool hasRunningBalance() => _runningBalance != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _transactionId = snapshotData['transactionId'] as String?;
    _userId = snapshotData['userId'] as String?;
    _customerName = snapshotData['customerName'] as String?;
    _shopName = snapshotData['shopName'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _transactionTime = snapshotData['transactionTime'] as DateTime?;
    _transactionType = snapshotData['transactionType'] as String?;
    _deliveryAgentId = snapshotData['deliveryAgentId'] as String?;
    _runningBalance = castToType<double>(snapshotData['runningBalance']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('cashBook')
          : FirebaseFirestore.instance.collectionGroup('cashBook');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('cashBook').doc(id);

  static Stream<CashBookRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CashBookRecord.fromSnapshot(s));

  static Future<CashBookRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CashBookRecord.fromSnapshot(s));

  static CashBookRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CashBookRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CashBookRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CashBookRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CashBookRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CashBookRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCashBookRecordData({
  String? transactionId,
  String? userId,
  String? customerName,
  String? shopName,
  double? amount,
  DateTime? transactionTime,
  String? transactionType,
  String? deliveryAgentId,
  double? runningBalance,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'transactionId': transactionId,
      'userId': userId,
      'customerName': customerName,
      'shopName': shopName,
      'amount': amount,
      'transactionTime': transactionTime,
      'transactionType': transactionType,
      'deliveryAgentId': deliveryAgentId,
      'runningBalance': runningBalance,
    }.withoutNulls,
  );

  return firestoreData;
}

class CashBookRecordDocumentEquality implements Equality<CashBookRecord> {
  const CashBookRecordDocumentEquality();

  @override
  bool equals(CashBookRecord? e1, CashBookRecord? e2) {
    return e1?.transactionId == e2?.transactionId &&
        e1?.userId == e2?.userId &&
        e1?.customerName == e2?.customerName &&
        e1?.shopName == e2?.shopName &&
        e1?.amount == e2?.amount &&
        e1?.transactionTime == e2?.transactionTime &&
        e1?.transactionType == e2?.transactionType &&
        e1?.deliveryAgentId == e2?.deliveryAgentId &&
        e1?.runningBalance == e2?.runningBalance;
  }

  @override
  int hash(CashBookRecord? e) => const ListEquality().hash([
        e?.transactionId,
        e?.userId,
        e?.customerName,
        e?.shopName,
        e?.amount,
        e?.transactionTime,
        e?.transactionType,
        e?.deliveryAgentId,
        e?.runningBalance
      ]);

  @override
  bool isValidKey(Object? o) => o is CashBookRecord;
}
