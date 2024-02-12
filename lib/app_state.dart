import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _tempFromDate = prefs.containsKey('ff_tempFromDate')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_tempFromDate')!)
          : _tempFromDate;
    });
    _safeInit(() {
      _tempToDate = prefs.containsKey('ff_tempToDate')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_tempToDate')!)
          : _tempToDate;
    });
    _safeInit(() {
      _tempCartItem = prefs
              .getStringList('ff_tempCartItem')
              ?.map((x) {
                try {
                  return CartItemStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _tempCartItem;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_tempCart')) {
        try {
          final serializedData = prefs.getString('ff_tempCart') ?? '{}';
          _tempCart =
              CartItemStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DocumentReference? _branchRef = FirebaseFirestore.instance.doc('/root/coc01');
  DocumentReference? get branchRef => _branchRef;
  set branchRef(DocumentReference? _value) {
    _branchRef = _value;
  }

  DateTime? _tempFromDate;
  DateTime? get tempFromDate => _tempFromDate;
  set tempFromDate(DateTime? _value) {
    _tempFromDate = _value;
    _value != null
        ? prefs.setInt('ff_tempFromDate', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_tempFromDate');
  }

  DateTime? _tempToDate;
  DateTime? get tempToDate => _tempToDate;
  set tempToDate(DateTime? _value) {
    _tempToDate = _value;
    _value != null
        ? prefs.setInt('ff_tempToDate', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_tempToDate');
  }

  String _tempProductName = '';
  String get tempProductName => _tempProductName;
  set tempProductName(String _value) {
    _tempProductName = _value;
  }

  String _tempProductId = '';
  String get tempProductId => _tempProductId;
  set tempProductId(String _value) {
    _tempProductId = _value;
  }

  DateTime? _tempDateTime;
  DateTime? get tempDateTime => _tempDateTime;
  set tempDateTime(DateTime? _value) {
    _tempDateTime = _value;
  }

  String _tempCustomerName = '';
  String get tempCustomerName => _tempCustomerName;
  set tempCustomerName(String _value) {
    _tempCustomerName = _value;
  }

  String _tempCustomerId = '';
  String get tempCustomerId => _tempCustomerId;
  set tempCustomerId(String _value) {
    _tempCustomerId = _value;
  }

  String _tempCustomerPhoneNumber = '';
  String get tempCustomerPhoneNumber => _tempCustomerPhoneNumber;
  set tempCustomerPhoneNumber(String _value) {
    _tempCustomerPhoneNumber = _value;
  }

  List<CartItemStruct> _tempCartItem = [];
  List<CartItemStruct> get tempCartItem => _tempCartItem;
  set tempCartItem(List<CartItemStruct> _value) {
    _tempCartItem = _value;
    prefs.setStringList(
        'ff_tempCartItem', _value.map((x) => x.serialize()).toList());
  }

  void addToTempCartItem(CartItemStruct _value) {
    _tempCartItem.add(_value);
    prefs.setStringList(
        'ff_tempCartItem', _tempCartItem.map((x) => x.serialize()).toList());
  }

  void removeFromTempCartItem(CartItemStruct _value) {
    _tempCartItem.remove(_value);
    prefs.setStringList(
        'ff_tempCartItem', _tempCartItem.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTempCartItem(int _index) {
    _tempCartItem.removeAt(_index);
    prefs.setStringList(
        'ff_tempCartItem', _tempCartItem.map((x) => x.serialize()).toList());
  }

  void updateTempCartItemAtIndex(
    int _index,
    CartItemStruct Function(CartItemStruct) updateFn,
  ) {
    _tempCartItem[_index] = updateFn(_tempCartItem[_index]);
    prefs.setStringList(
        'ff_tempCartItem', _tempCartItem.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTempCartItem(int _index, CartItemStruct _value) {
    _tempCartItem.insert(_index, _value);
    prefs.setStringList(
        'ff_tempCartItem', _tempCartItem.map((x) => x.serialize()).toList());
  }

  CartItemStruct _tempCart = CartItemStruct();
  CartItemStruct get tempCart => _tempCart;
  set tempCart(CartItemStruct _value) {
    _tempCart = _value;
    prefs.setString('ff_tempCart', _value.serialize());
  }

  void updateTempCartStruct(Function(CartItemStruct) updateFn) {
    updateFn(_tempCart);
    prefs.setString('ff_tempCart', _tempCart.serialize());
  }

  String _tempCustomerAddress = '';
  String get tempCustomerAddress => _tempCustomerAddress;
  set tempCustomerAddress(String _value) {
    _tempCustomerAddress = _value;
  }

  String _tempSubCategoryId = '';
  String get tempSubCategoryId => _tempSubCategoryId;
  set tempSubCategoryId(String _value) {
    _tempSubCategoryId = _value;
  }

  bool _tempShowIf = false;
  bool get tempShowIf => _tempShowIf;
  set tempShowIf(bool _value) {
    _tempShowIf = _value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
