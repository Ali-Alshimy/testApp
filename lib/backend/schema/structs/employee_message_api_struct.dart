// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmployeeMessageApiStruct extends BaseStruct {
  EmployeeMessageApiStruct({
    List<EmployeeCheckStruct>? message,
  }) : _message = message;

  // "message" field.
  List<EmployeeCheckStruct>? _message;
  List<EmployeeCheckStruct> get message => _message ?? const [];
  set message(List<EmployeeCheckStruct>? val) => _message = val;

  void updateMessage(Function(List<EmployeeCheckStruct>) updateFn) {
    updateFn(_message ??= []);
  }

  bool hasMessage() => _message != null;

  static EmployeeMessageApiStruct fromMap(Map<String, dynamic> data) =>
      EmployeeMessageApiStruct(
        message: getStructList(
          data['message'],
          EmployeeCheckStruct.fromMap,
        ),
      );

  static EmployeeMessageApiStruct? maybeFromMap(dynamic data) => data is Map
      ? EmployeeMessageApiStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'message': _message?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'message': serializeParam(
          _message,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static EmployeeMessageApiStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      EmployeeMessageApiStruct(
        message: deserializeStructParam<EmployeeCheckStruct>(
          data['message'],
          ParamType.DataStruct,
          true,
          structBuilder: EmployeeCheckStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'EmployeeMessageApiStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is EmployeeMessageApiStruct &&
        listEquality.equals(message, other.message);
  }

  @override
  int get hashCode => const ListEquality().hash([message]);
}

EmployeeMessageApiStruct createEmployeeMessageApiStruct() =>
    EmployeeMessageApiStruct();
