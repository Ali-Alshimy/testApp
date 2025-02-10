// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmployeeCheckStruct extends BaseStruct {
  EmployeeCheckStruct({
    String? employeeId,
    String? employeeName,
    String? checkInDate,
    String? checkInTime,
    String? checkOutDate,
    String? checkOutDay,
    String? checkInDay,
    String? checkOutTime,
  })  : _employeeId = employeeId,
        _employeeName = employeeName,
        _checkInDate = checkInDate,
        _checkInTime = checkInTime,
        _checkOutDate = checkOutDate,
        _checkOutDay = checkOutDay,
        _checkInDay = checkInDay,
        _checkOutTime = checkOutTime;

  // "employee_id" field.
  String? _employeeId;
  String get employeeId => _employeeId ?? '';
  set employeeId(String? val) => _employeeId = val;

  bool hasEmployeeId() => _employeeId != null;

  // "employee_name" field.
  String? _employeeName;
  String get employeeName => _employeeName ?? '';
  set employeeName(String? val) => _employeeName = val;

  bool hasEmployeeName() => _employeeName != null;

  // "check_in_date" field.
  String? _checkInDate;
  String get checkInDate => _checkInDate ?? '';
  set checkInDate(String? val) => _checkInDate = val;

  bool hasCheckInDate() => _checkInDate != null;

  // "check_in_time" field.
  String? _checkInTime;
  String get checkInTime => _checkInTime ?? '';
  set checkInTime(String? val) => _checkInTime = val;

  bool hasCheckInTime() => _checkInTime != null;

  // "check_out_date" field.
  String? _checkOutDate;
  String get checkOutDate => _checkOutDate ?? '';
  set checkOutDate(String? val) => _checkOutDate = val;

  bool hasCheckOutDate() => _checkOutDate != null;

  // "check_out_day" field.
  String? _checkOutDay;
  String get checkOutDay => _checkOutDay ?? '';
  set checkOutDay(String? val) => _checkOutDay = val;

  bool hasCheckOutDay() => _checkOutDay != null;

  // "check_in_day" field.
  String? _checkInDay;
  String get checkInDay => _checkInDay ?? '';
  set checkInDay(String? val) => _checkInDay = val;

  bool hasCheckInDay() => _checkInDay != null;

  // "check_out_time" field.
  String? _checkOutTime;
  String get checkOutTime => _checkOutTime ?? '';
  set checkOutTime(String? val) => _checkOutTime = val;

  bool hasCheckOutTime() => _checkOutTime != null;

  static EmployeeCheckStruct fromMap(Map<String, dynamic> data) =>
      EmployeeCheckStruct(
        employeeId: data['employee_id'] as String?,
        employeeName: data['employee_name'] as String?,
        checkInDate: data['check_in_date'] as String?,
        checkInTime: data['check_in_time'] as String?,
        checkOutDate: data['check_out_date'] as String?,
        checkOutDay: data['check_out_day'] as String?,
        checkInDay: data['check_in_day'] as String?,
        checkOutTime: data['check_out_time'] as String?,
      );

  static EmployeeCheckStruct? maybeFromMap(dynamic data) => data is Map
      ? EmployeeCheckStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'employee_id': _employeeId,
        'employee_name': _employeeName,
        'check_in_date': _checkInDate,
        'check_in_time': _checkInTime,
        'check_out_date': _checkOutDate,
        'check_out_day': _checkOutDay,
        'check_in_day': _checkInDay,
        'check_out_time': _checkOutTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'employee_id': serializeParam(
          _employeeId,
          ParamType.String,
        ),
        'employee_name': serializeParam(
          _employeeName,
          ParamType.String,
        ),
        'check_in_date': serializeParam(
          _checkInDate,
          ParamType.String,
        ),
        'check_in_time': serializeParam(
          _checkInTime,
          ParamType.String,
        ),
        'check_out_date': serializeParam(
          _checkOutDate,
          ParamType.String,
        ),
        'check_out_day': serializeParam(
          _checkOutDay,
          ParamType.String,
        ),
        'check_in_day': serializeParam(
          _checkInDay,
          ParamType.String,
        ),
        'check_out_time': serializeParam(
          _checkOutTime,
          ParamType.String,
        ),
      }.withoutNulls;

  static EmployeeCheckStruct fromSerializableMap(Map<String, dynamic> data) =>
      EmployeeCheckStruct(
        employeeId: deserializeParam(
          data['employee_id'],
          ParamType.String,
          false,
        ),
        employeeName: deserializeParam(
          data['employee_name'],
          ParamType.String,
          false,
        ),
        checkInDate: deserializeParam(
          data['check_in_date'],
          ParamType.String,
          false,
        ),
        checkInTime: deserializeParam(
          data['check_in_time'],
          ParamType.String,
          false,
        ),
        checkOutDate: deserializeParam(
          data['check_out_date'],
          ParamType.String,
          false,
        ),
        checkOutDay: deserializeParam(
          data['check_out_day'],
          ParamType.String,
          false,
        ),
        checkInDay: deserializeParam(
          data['check_in_day'],
          ParamType.String,
          false,
        ),
        checkOutTime: deserializeParam(
          data['check_out_time'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'EmployeeCheckStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EmployeeCheckStruct &&
        employeeId == other.employeeId &&
        employeeName == other.employeeName &&
        checkInDate == other.checkInDate &&
        checkInTime == other.checkInTime &&
        checkOutDate == other.checkOutDate &&
        checkOutDay == other.checkOutDay &&
        checkInDay == other.checkInDay &&
        checkOutTime == other.checkOutTime;
  }

  @override
  int get hashCode => const ListEquality().hash([
        employeeId,
        employeeName,
        checkInDate,
        checkInTime,
        checkOutDate,
        checkOutDay,
        checkInDay,
        checkOutTime
      ]);
}

EmployeeCheckStruct createEmployeeCheckStruct({
  String? employeeId,
  String? employeeName,
  String? checkInDate,
  String? checkInTime,
  String? checkOutDate,
  String? checkOutDay,
  String? checkInDay,
  String? checkOutTime,
}) =>
    EmployeeCheckStruct(
      employeeId: employeeId,
      employeeName: employeeName,
      checkInDate: checkInDate,
      checkInTime: checkInTime,
      checkOutDate: checkOutDate,
      checkOutDay: checkOutDay,
      checkInDay: checkInDay,
      checkOutTime: checkOutTime,
    );
