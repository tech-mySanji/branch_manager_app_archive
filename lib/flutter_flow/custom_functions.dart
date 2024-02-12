import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<String>? keyboardFunction(
  String field1,
  String field2,
) {
  var string1 = field1.toLowerCase();
  var string2 = field2.toLowerCase();
  var inputString = string1 + " " + string2;
  final list = inputString.split(" ");
  var keywords = [
    " ",
    string1,
    string2,
  ];

  var listIterator = list.iterator;

  while (listIterator.moveNext()) {
    var appendString = "";

    listIterator.current.runes.forEach((int rune) {
      appendString += String.fromCharCode(rune);
      keywords.add(appendString);
    });

    inputString = inputString.replaceAll(listIterator.current.toString(), " ");
  }

  return keywords;
}

DateTime endTimestampOfDay(DateTime timestampArg) {
  // get a timestamp and rerturn a timestamp with a time of end of the day
  return DateTime(
    timestampArg.year,
    timestampArg.month,
    timestampArg.day,
    23,
    59,
    59,
    999,
    timestampArg.microsecond,
  );
}

double returnTotalSales(List<OrdersRecord> orderList) {
  // return total sales from a list of document
  double total = 0;
  for (var order in orderList) {
    total += order.total ?? 0;
  }
  return total;
}

double returnGrandTotal(List<CartItemStruct> listOfCartItem) {
  // give me grandtotal from the list of items provided in the arguments
  double grandTotal = 0.0;
  for (CartItemStruct item in listOfCartItem) {
    grandTotal += item.sellingPrice * item.quantity;
  }
  return grandTotal;
}

DateTime startTimeProvider(DateTime currentTime) {
  // get any time of the date and return starting time of the day
  return DateTime(currentTime.year, currentTime.month, currentTime.day);
}

double returnGrandTotalOfPackages(List<PackagesRecord> packagelist) {
  // use the quantity and price give grand total
  double grandTotal = 0.0;
  for (PackagesRecord package in packagelist) {
    grandTotal += package.quantity * package.sellingPrice;
  }
  return grandTotal;
}
