import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PackagesRecord extends FirestoreRecord {
  PackagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "customer_name" field.
  String? _customerName;
  String get customerName => _customerName ?? '';
  bool hasCustomerName() => _customerName != null;

  // "delivery_agent_id" field.
  String? _deliveryAgentId;
  String get deliveryAgentId => _deliveryAgentId ?? '';
  bool hasDeliveryAgentId() => _deliveryAgentId != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "order_id" field.
  String? _orderId;
  String get orderId => _orderId ?? '';
  bool hasOrderId() => _orderId != null;

  // "order_time" field.
  DateTime? _orderTime;
  DateTime? get orderTime => _orderTime;
  bool hasOrderTime() => _orderTime != null;

  // "package_Id" field.
  String? _packageId;
  String get packageId => _packageId ?? '';
  bool hasPackageId() => _packageId != null;

  // "packed_time" field.
  DateTime? _packedTime;
  DateTime? get packedTime => _packedTime;
  bool hasPackedTime() => _packedTime != null;

  // "product_name" field.
  String? _productName;
  String get productName => _productName ?? '';
  bool hasProductName() => _productName != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  bool hasUnit() => _unit != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "vendor_id" field.
  String? _vendorId;
  String get vendorId => _vendorId ?? '';
  bool hasVendorId() => _vendorId != null;

  // "quantity" field.
  double? _quantity;
  double get quantity => _quantity ?? 0.0;
  bool hasQuantity() => _quantity != null;

  // "selling_price" field.
  double? _sellingPrice;
  double get sellingPrice => _sellingPrice ?? 0.0;
  bool hasSellingPrice() => _sellingPrice != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _customerName = snapshotData['customer_name'] as String?;
    _deliveryAgentId = snapshotData['delivery_agent_id'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _orderId = snapshotData['order_id'] as String?;
    _orderTime = snapshotData['order_time'] as DateTime?;
    _packageId = snapshotData['package_Id'] as String?;
    _packedTime = snapshotData['packed_time'] as DateTime?;
    _productName = snapshotData['product_name'] as String?;
    _status = snapshotData['status'] as String?;
    _unit = snapshotData['unit'] as String?;
    _userId = snapshotData['user_id'] as String?;
    _vendorId = snapshotData['vendor_id'] as String?;
    _quantity = castToType<double>(snapshotData['quantity']);
    _sellingPrice = castToType<double>(snapshotData['selling_price']);
    _phoneNumber = snapshotData['phone_number'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('packages')
          : FirebaseFirestore.instance.collectionGroup('packages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('packages').doc(id);

  static Stream<PackagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PackagesRecord.fromSnapshot(s));

  static Future<PackagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PackagesRecord.fromSnapshot(s));

  static PackagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PackagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PackagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PackagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PackagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PackagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPackagesRecordData({
  String? customerName,
  String? deliveryAgentId,
  LatLng? location,
  String? orderId,
  DateTime? orderTime,
  String? packageId,
  DateTime? packedTime,
  String? productName,
  String? status,
  String? unit,
  String? userId,
  String? vendorId,
  double? quantity,
  double? sellingPrice,
  String? phoneNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'customer_name': customerName,
      'delivery_agent_id': deliveryAgentId,
      'location': location,
      'order_id': orderId,
      'order_time': orderTime,
      'package_Id': packageId,
      'packed_time': packedTime,
      'product_name': productName,
      'status': status,
      'unit': unit,
      'user_id': userId,
      'vendor_id': vendorId,
      'quantity': quantity,
      'selling_price': sellingPrice,
      'phone_number': phoneNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class PackagesRecordDocumentEquality implements Equality<PackagesRecord> {
  const PackagesRecordDocumentEquality();

  @override
  bool equals(PackagesRecord? e1, PackagesRecord? e2) {
    return e1?.customerName == e2?.customerName &&
        e1?.deliveryAgentId == e2?.deliveryAgentId &&
        e1?.location == e2?.location &&
        e1?.orderId == e2?.orderId &&
        e1?.orderTime == e2?.orderTime &&
        e1?.packageId == e2?.packageId &&
        e1?.packedTime == e2?.packedTime &&
        e1?.productName == e2?.productName &&
        e1?.status == e2?.status &&
        e1?.unit == e2?.unit &&
        e1?.userId == e2?.userId &&
        e1?.vendorId == e2?.vendorId &&
        e1?.quantity == e2?.quantity &&
        e1?.sellingPrice == e2?.sellingPrice &&
        e1?.phoneNumber == e2?.phoneNumber;
  }

  @override
  int hash(PackagesRecord? e) => const ListEquality().hash([
        e?.customerName,
        e?.deliveryAgentId,
        e?.location,
        e?.orderId,
        e?.orderTime,
        e?.packageId,
        e?.packedTime,
        e?.productName,
        e?.status,
        e?.unit,
        e?.userId,
        e?.vendorId,
        e?.quantity,
        e?.sellingPrice,
        e?.phoneNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is PackagesRecord;
}
