// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OnboardingListStruct extends BaseStruct {
  OnboardingListStruct({
    String? employeeName,
    String? designation,
    String? department,
    DateTime? dateOfJoining,
    String? image,
  })  : _employeeName = employeeName,
        _designation = designation,
        _department = department,
        _dateOfJoining = dateOfJoining,
        _image = image;

  // "employee_name" field.
  String? _employeeName;
  String get employeeName => _employeeName ?? '';
  set employeeName(String? val) => _employeeName = val;

  bool hasEmployeeName() => _employeeName != null;

  // "designation" field.
  String? _designation;
  String get designation => _designation ?? '';
  set designation(String? val) => _designation = val;

  bool hasDesignation() => _designation != null;

  // "department" field.
  String? _department;
  String get department => _department ?? '';
  set department(String? val) => _department = val;

  bool hasDepartment() => _department != null;

  // "date_of_joining" field.
  DateTime? _dateOfJoining;
  DateTime? get dateOfJoining => _dateOfJoining;
  set dateOfJoining(DateTime? val) => _dateOfJoining = val;

  bool hasDateOfJoining() => _dateOfJoining != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  static OnboardingListStruct fromMap(Map<String, dynamic> data) =>
      OnboardingListStruct(
        employeeName: data['employee_name'] as String?,
        designation: data['designation'] as String?,
        department: data['department'] as String?,
        dateOfJoining: data['date_of_joining'] as DateTime?,
        image: data['image'] as String?,
      );

  static OnboardingListStruct? maybeFromMap(dynamic data) => data is Map
      ? OnboardingListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'employee_name': _employeeName,
        'designation': _designation,
        'department': _department,
        'date_of_joining': _dateOfJoining,
        'image': _image,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'employee_name': serializeParam(
          _employeeName,
          ParamType.String,
        ),
        'designation': serializeParam(
          _designation,
          ParamType.String,
        ),
        'department': serializeParam(
          _department,
          ParamType.String,
        ),
        'date_of_joining': serializeParam(
          _dateOfJoining,
          ParamType.DateTime,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
      }.withoutNulls;

  static OnboardingListStruct fromSerializableMap(Map<String, dynamic> data) =>
      OnboardingListStruct(
        employeeName: deserializeParam(
          data['employee_name'],
          ParamType.String,
          false,
        ),
        designation: deserializeParam(
          data['designation'],
          ParamType.String,
          false,
        ),
        department: deserializeParam(
          data['department'],
          ParamType.String,
          false,
        ),
        dateOfJoining: deserializeParam(
          data['date_of_joining'],
          ParamType.DateTime,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OnboardingListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OnboardingListStruct &&
        employeeName == other.employeeName &&
        designation == other.designation &&
        department == other.department &&
        dateOfJoining == other.dateOfJoining &&
        image == other.image;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([employeeName, designation, department, dateOfJoining, image]);
}

OnboardingListStruct createOnboardingListStruct({
  String? employeeName,
  String? designation,
  String? department,
  DateTime? dateOfJoining,
  String? image,
}) =>
    OnboardingListStruct(
      employeeName: employeeName,
      designation: designation,
      department: department,
      dateOfJoining: dateOfJoining,
      image: image,
    );
