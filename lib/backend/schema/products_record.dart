import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductsRecord extends FirestoreRecord {
  ProductsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "barcode" field.
  String? _barcode;
  String get barcode => _barcode ?? '';
  bool hasBarcode() => _barcode != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  bool hasIndex() => _index != null;

  // "margin" field.
  double? _margin;
  double get margin => _margin ?? 0.0;
  bool hasMargin() => _margin != null;

  // "keyword" field.
  List<String>? _keyword;
  List<String> get keyword => _keyword ?? const [];
  bool hasKeyword() => _keyword != null;

  // "product_name_secondary" field.
  String? _productNameSecondary;
  String get productNameSecondary => _productNameSecondary ?? '';
  bool hasProductNameSecondary() => _productNameSecondary != null;

  // "product_id" field.
  String? _productId;
  String get productId => _productId ?? '';
  bool hasProductId() => _productId != null;

  // "product_image" field.
  String? _productImage;
  String get productImage => _productImage ?? '';
  bool hasProductImage() => _productImage != null;

  // "show_if" field.
  bool? _showIf;
  bool get showIf => _showIf ?? false;
  bool hasShowIf() => _showIf != null;

  // "is_option_avail" field.
  bool? _isOptionAvail;
  bool get isOptionAvail => _isOptionAvail ?? false;
  bool hasIsOptionAvail() => _isOptionAvail != null;

  // "sub_category_id" field.
  String? _subCategoryId;
  String get subCategoryId => _subCategoryId ?? '';
  bool hasSubCategoryId() => _subCategoryId != null;

  // "delivery_agent_id" field.
  String? _deliveryAgentId;
  String get deliveryAgentId => _deliveryAgentId ?? '';
  bool hasDeliveryAgentId() => _deliveryAgentId != null;

  // "vendor_id" field.
  String? _vendorId;
  String get vendorId => _vendorId ?? '';
  bool hasVendorId() => _vendorId != null;

  // "margin_type" field.
  String? _marginType;
  String get marginType => _marginType ?? '';
  bool hasMarginType() => _marginType != null;

  // "purchase_price" field.
  double? _purchasePrice;
  double get purchasePrice => _purchasePrice ?? 0.0;
  bool hasPurchasePrice() => _purchasePrice != null;

  // "minimum_quantity" field.
  double? _minimumQuantity;
  double get minimumQuantity => _minimumQuantity ?? 0.0;
  bool hasMinimumQuantity() => _minimumQuantity != null;

  // "incremental_quantity" field.
  double? _incrementalQuantity;
  double get incrementalQuantity => _incrementalQuantity ?? 0.0;
  bool hasIncrementalQuantity() => _incrementalQuantity != null;

  // "product_description" field.
  String? _productDescription;
  String get productDescription => _productDescription ?? '';
  bool hasProductDescription() => _productDescription != null;

  // "product_name" field.
  String? _productName;
  String get productName => _productName ?? '';
  bool hasProductName() => _productName != null;

  // "mrp" field.
  double? _mrp;
  double get mrp => _mrp ?? 0.0;
  bool hasMrp() => _mrp != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  bool hasUnit() => _unit != null;

  // "selling_price" field.
  double? _sellingPrice;
  double get sellingPrice => _sellingPrice ?? 0.0;
  bool hasSellingPrice() => _sellingPrice != null;

  // "optionList" field.
  List<OptionTypeStruct>? _optionList;
  List<OptionTypeStruct> get optionList => _optionList ?? const [];
  bool hasOptionList() => _optionList != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _barcode = snapshotData['barcode'] as String?;
    _index = castToType<int>(snapshotData['index']);
    _margin = castToType<double>(snapshotData['margin']);
    _keyword = getDataList(snapshotData['keyword']);
    _productNameSecondary = snapshotData['product_name_secondary'] as String?;
    _productId = snapshotData['product_id'] as String?;
    _productImage = snapshotData['product_image'] as String?;
    _showIf = snapshotData['show_if'] as bool?;
    _isOptionAvail = snapshotData['is_option_avail'] as bool?;
    _subCategoryId = snapshotData['sub_category_id'] as String?;
    _deliveryAgentId = snapshotData['delivery_agent_id'] as String?;
    _vendorId = snapshotData['vendor_id'] as String?;
    _marginType = snapshotData['margin_type'] as String?;
    _purchasePrice = castToType<double>(snapshotData['purchase_price']);
    _minimumQuantity = castToType<double>(snapshotData['minimum_quantity']);
    _incrementalQuantity =
        castToType<double>(snapshotData['incremental_quantity']);
    _productDescription = snapshotData['product_description'] as String?;
    _productName = snapshotData['product_name'] as String?;
    _mrp = castToType<double>(snapshotData['mrp']);
    _unit = snapshotData['unit'] as String?;
    _sellingPrice = castToType<double>(snapshotData['selling_price']);
    _optionList = getStructList(
      snapshotData['optionList'],
      OptionTypeStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('products')
          : FirebaseFirestore.instance.collectionGroup('products');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('products').doc(id);

  static Stream<ProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductsRecord.fromSnapshot(s));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductsRecord.fromSnapshot(s));

  static ProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductsRecordData({
  String? barcode,
  int? index,
  double? margin,
  String? productNameSecondary,
  String? productId,
  String? productImage,
  bool? showIf,
  bool? isOptionAvail,
  String? subCategoryId,
  String? deliveryAgentId,
  String? vendorId,
  String? marginType,
  double? purchasePrice,
  double? minimumQuantity,
  double? incrementalQuantity,
  String? productDescription,
  String? productName,
  double? mrp,
  String? unit,
  double? sellingPrice,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'barcode': barcode,
      'index': index,
      'margin': margin,
      'product_name_secondary': productNameSecondary,
      'product_id': productId,
      'product_image': productImage,
      'show_if': showIf,
      'is_option_avail': isOptionAvail,
      'sub_category_id': subCategoryId,
      'delivery_agent_id': deliveryAgentId,
      'vendor_id': vendorId,
      'margin_type': marginType,
      'purchase_price': purchasePrice,
      'minimum_quantity': minimumQuantity,
      'incremental_quantity': incrementalQuantity,
      'product_description': productDescription,
      'product_name': productName,
      'mrp': mrp,
      'unit': unit,
      'selling_price': sellingPrice,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductsRecordDocumentEquality implements Equality<ProductsRecord> {
  const ProductsRecordDocumentEquality();

  @override
  bool equals(ProductsRecord? e1, ProductsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.barcode == e2?.barcode &&
        e1?.index == e2?.index &&
        e1?.margin == e2?.margin &&
        listEquality.equals(e1?.keyword, e2?.keyword) &&
        e1?.productNameSecondary == e2?.productNameSecondary &&
        e1?.productId == e2?.productId &&
        e1?.productImage == e2?.productImage &&
        e1?.showIf == e2?.showIf &&
        e1?.isOptionAvail == e2?.isOptionAvail &&
        e1?.subCategoryId == e2?.subCategoryId &&
        e1?.deliveryAgentId == e2?.deliveryAgentId &&
        e1?.vendorId == e2?.vendorId &&
        e1?.marginType == e2?.marginType &&
        e1?.purchasePrice == e2?.purchasePrice &&
        e1?.minimumQuantity == e2?.minimumQuantity &&
        e1?.incrementalQuantity == e2?.incrementalQuantity &&
        e1?.productDescription == e2?.productDescription &&
        e1?.productName == e2?.productName &&
        e1?.mrp == e2?.mrp &&
        e1?.unit == e2?.unit &&
        e1?.sellingPrice == e2?.sellingPrice &&
        listEquality.equals(e1?.optionList, e2?.optionList);
  }

  @override
  int hash(ProductsRecord? e) => const ListEquality().hash([
        e?.barcode,
        e?.index,
        e?.margin,
        e?.keyword,
        e?.productNameSecondary,
        e?.productId,
        e?.productImage,
        e?.showIf,
        e?.isOptionAvail,
        e?.subCategoryId,
        e?.deliveryAgentId,
        e?.vendorId,
        e?.marginType,
        e?.purchasePrice,
        e?.minimumQuantity,
        e?.incrementalQuantity,
        e?.productDescription,
        e?.productName,
        e?.mrp,
        e?.unit,
        e?.sellingPrice,
        e?.optionList
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductsRecord;
}
