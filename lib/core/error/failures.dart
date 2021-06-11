import 'dart:convert';

import "package:equatable/equatable.dart";

// General failures
class Failure extends Equatable {
  final String message;

  Failure(this.message);

  @override
  String toString() => _utf8convert(message);

  static String _utf8convert(String text) {
    List<int> bytes = text.toString().codeUnits;
    return utf8.decode(bytes);
  }

  @override
  List<Object> get props => [message];
}