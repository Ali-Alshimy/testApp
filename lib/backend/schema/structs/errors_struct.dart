// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ErrorsStruct extends BaseStruct {
  ErrorsStruct({
    String? message,
    String? error,
    String? type,
    String? descrption,
    String? details,
    String? statusCode,
  })  : _message = message,
        _error = error,
        _type = type,
        _descrption = descrption,
        _details = details,
        _statusCode = statusCode;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  // "error" field.
  String? _error;
  String get error => _error ?? '';
  set error(String? val) => _error = val;

  bool hasError() => _error != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "descrption" field.
  String? _descrption;
  String get descrption => _descrption ?? '';
  set descrption(String? val) => _descrption = val;

  bool hasDescrption() => _descrption != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  set details(String? val) => _details = val;

  bool hasDetails() => _details != null;

  // "statusCode" field.
  String? _statusCode;
  String get statusCode => _statusCode ?? '';
  set statusCode(String? val) => _statusCode = val;

  bool hasStatusCode() => _statusCode != null;

  static ErrorsStruct fromMap(Map<String, dynamic> data) => ErrorsStruct(
        message: data['message'] as String?,
        error: data['error'] as String?,
        type: data['type'] as String?,
        descrption: data['descrption'] as String?,
        details: data['details'] as String?,
        statusCode: data['statusCode'] as String?,
      );

  static ErrorsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ErrorsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'message': _message,
        'error': _error,
        'type': _type,
        'descrption': _descrption,
        'details': _details,
        'statusCode': _statusCode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'error': serializeParam(
          _error,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'descrption': serializeParam(
          _descrption,
          ParamType.String,
        ),
        'details': serializeParam(
          _details,
          ParamType.String,
        ),
        'statusCode': serializeParam(
          _statusCode,
          ParamType.String,
        ),
      }.withoutNulls;

  static ErrorsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ErrorsStruct(
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        error: deserializeParam(
          data['error'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        descrption: deserializeParam(
          data['descrption'],
          ParamType.String,
          false,
        ),
        details: deserializeParam(
          data['details'],
          ParamType.String,
          false,
        ),
        statusCode: deserializeParam(
          data['statusCode'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ErrorsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ErrorsStruct &&
        message == other.message &&
        error == other.error &&
        type == other.type &&
        descrption == other.descrption &&
        details == other.details &&
        statusCode == other.statusCode;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([message, error, type, descrption, details, statusCode]);
}

ErrorsStruct createErrorsStruct({
  String? message,
  String? error,
  String? type,
  String? descrption,
  String? details,
  String? statusCode,
}) =>
    ErrorsStruct(
      message: message,
      error: error,
      type: type,
      descrption: descrption,
      details: details,
      statusCode: statusCode,
    );
