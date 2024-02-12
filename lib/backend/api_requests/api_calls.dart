import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Firebase Function Group Code

class FirebaseFunctionGroup {
  static String baseUrl =
      'https://us-central1-mysanji-d2c2f.cloudfunctions.net/app';
  static Map<String, String> headers = {};
  static DeliveryAgentCreateCall deliveryAgentCreateCall =
      DeliveryAgentCreateCall();
  static VendorCreateCall vendorCreateCall = VendorCreateCall();
}

class DeliveryAgentCreateCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? phoneNumber = '',
    String? name = '',
    String? aadharNumber = '',
    String? licenseNumber = '',
    String? idProofImage = '',
    String? licenseImage = '',
    double? cashBalance = 0,
    String? address = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${email}",
  "phone_number": "${phoneNumber}",
  "delivery_agent_name": "${name}",
  "aadhar_number":"${aadharNumber}",
  "license_number": "${licenseNumber}",
  "id_proof_image": "${idProofImage}",
  "license_image": "${licenseImage}",
  "cash_balance": ${cashBalance},
  "branch_code": "coc01",
  "address": "${address}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'deliveryAgentCreate',
      apiUrl: '${FirebaseFunctionGroup.baseUrl}/delivery_agent_create',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class VendorCreateCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? phoneNumber = '',
    String? shopName = '',
    String? address = '',
    bool? vendorEditPurchaseQuantity,
    bool? vendorEditPurchasePrice,
    String? branchCode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "vendor_name": "${name}",
  "email": "${email}",
  "phone_number": "${phoneNumber}",
  "shop_name": "${shopName}",
  "address": "${address}",
  "vendor_edit_purchase_quantity": ${vendorEditPurchaseQuantity},
  "vendor_edit_purchase_price": ${vendorEditPurchasePrice},
  "branch_code": "${branchCode}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'vendorCreate',
      apiUrl: '${FirebaseFunctionGroup.baseUrl}/vendor_create',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Firebase Function Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
