import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriesRecord extends FirestoreRecord {
  CategoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "category_name" field.
  String? _categoryName;
  String get categoryName => _categoryName ?? '';
  bool hasCategoryName() => _categoryName != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  bool hasIndex() => _index != null;

  // "category_name_secondary" field.
  String? _categoryNameSecondary;
  String get categoryNameSecondary => _categoryNameSecondary ?? '';
  bool hasCategoryNameSecondary() => _categoryNameSecondary != null;

  // "is_parent_category" field.
  bool? _isParentCategory;
  bool get isParentCategory => _isParentCategory ?? false;
  bool hasIsParentCategory() => _isParentCategory != null;

  // "parent_category_id" field.
  String? _parentCategoryId;
  String get parentCategoryId => _parentCategoryId ?? '';
  bool hasParentCategoryId() => _parentCategoryId != null;

  // "category_image" field.
  String? _categoryImage;
  String get categoryImage => _categoryImage ?? '';
  bool hasCategoryImage() => _categoryImage != null;

  // "category_id" field.
  String? _categoryId;
  String get categoryId => _categoryId ?? '';
  bool hasCategoryId() => _categoryId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _categoryName = snapshotData['category_name'] as String?;
    _index = castToType<int>(snapshotData['index']);
    _categoryNameSecondary = snapshotData['category_name_secondary'] as String?;
    _isParentCategory = snapshotData['is_parent_category'] as bool?;
    _parentCategoryId = snapshotData['parent_category_id'] as String?;
    _categoryImage = snapshotData['category_image'] as String?;
    _categoryId = snapshotData['category_id'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('categories')
          : FirebaseFirestore.instance.collectionGroup('categories');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('categories').doc(id);

  static Stream<CategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriesRecord.fromSnapshot(s));

  static Future<CategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriesRecord.fromSnapshot(s));

  static CategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriesRecordData({
  String? categoryName,
  int? index,
  String? categoryNameSecondary,
  bool? isParentCategory,
  String? parentCategoryId,
  String? categoryImage,
  String? categoryId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category_name': categoryName,
      'index': index,
      'category_name_secondary': categoryNameSecondary,
      'is_parent_category': isParentCategory,
      'parent_category_id': parentCategoryId,
      'category_image': categoryImage,
      'category_id': categoryId,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoriesRecordDocumentEquality implements Equality<CategoriesRecord> {
  const CategoriesRecordDocumentEquality();

  @override
  bool equals(CategoriesRecord? e1, CategoriesRecord? e2) {
    return e1?.categoryName == e2?.categoryName &&
        e1?.index == e2?.index &&
        e1?.categoryNameSecondary == e2?.categoryNameSecondary &&
        e1?.isParentCategory == e2?.isParentCategory &&
        e1?.parentCategoryId == e2?.parentCategoryId &&
        e1?.categoryImage == e2?.categoryImage &&
        e1?.categoryId == e2?.categoryId;
  }

  @override
  int hash(CategoriesRecord? e) => const ListEquality().hash([
        e?.categoryName,
        e?.index,
        e?.categoryNameSecondary,
        e?.isParentCategory,
        e?.parentCategoryId,
        e?.categoryImage,
        e?.categoryId
      ]);

  @override
  bool isValidKey(Object? o) => o is CategoriesRecord;
}
