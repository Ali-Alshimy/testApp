// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReferralDataStruct extends BaseStruct {
  ReferralDataStruct({
    String? department,
    String? jobTitle,
    String? openedJobId,
    String? jobDescription,
    String? currency,
    String? status,
    int? lowerRangeSalary,
    int? upperRangeSalary,
    int? index,
  })  : _department = department,
        _jobTitle = jobTitle,
        _openedJobId = openedJobId,
        _jobDescription = jobDescription,
        _currency = currency,
        _status = status,
        _lowerRangeSalary = lowerRangeSalary,
        _upperRangeSalary = upperRangeSalary,
        _index = index;

  // "department" field.
  String? _department;
  String get department => _department ?? '';
  set department(String? val) => _department = val;

  bool hasDepartment() => _department != null;

  // "Job_title" field.
  String? _jobTitle;
  String get jobTitle => _jobTitle ?? '';
  set jobTitle(String? val) => _jobTitle = val;

  bool hasJobTitle() => _jobTitle != null;

  // "openedJobId" field.
  String? _openedJobId;
  String get openedJobId => _openedJobId ?? '';
  set openedJobId(String? val) => _openedJobId = val;

  bool hasOpenedJobId() => _openedJobId != null;

  // "jobDescription" field.
  String? _jobDescription;
  String get jobDescription => _jobDescription ?? '';
  set jobDescription(String? val) => _jobDescription = val;

  bool hasJobDescription() => _jobDescription != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  set currency(String? val) => _currency = val;

  bool hasCurrency() => _currency != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "lowerRangeSalary" field.
  int? _lowerRangeSalary;
  int get lowerRangeSalary => _lowerRangeSalary ?? 0;
  set lowerRangeSalary(int? val) => _lowerRangeSalary = val;

  void incrementLowerRangeSalary(int amount) =>
      lowerRangeSalary = lowerRangeSalary + amount;

  bool hasLowerRangeSalary() => _lowerRangeSalary != null;

  // "upperRangeSalary" field.
  int? _upperRangeSalary;
  int get upperRangeSalary => _upperRangeSalary ?? 0;
  set upperRangeSalary(int? val) => _upperRangeSalary = val;

  void incrementUpperRangeSalary(int amount) =>
      upperRangeSalary = upperRangeSalary + amount;

  bool hasUpperRangeSalary() => _upperRangeSalary != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  set index(int? val) => _index = val;

  void incrementIndex(int amount) => index = index + amount;

  bool hasIndex() => _index != null;

  static ReferralDataStruct fromMap(Map<String, dynamic> data) =>
      ReferralDataStruct(
        department: data['department'] as String?,
        jobTitle: data['Job_title'] as String?,
        openedJobId: data['openedJobId'] as String?,
        jobDescription: data['jobDescription'] as String?,
        currency: data['currency'] as String?,
        status: data['status'] as String?,
        lowerRangeSalary: castToType<int>(data['lowerRangeSalary']),
        upperRangeSalary: castToType<int>(data['upperRangeSalary']),
        index: castToType<int>(data['index']),
      );

  static ReferralDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ReferralDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'department': _department,
        'Job_title': _jobTitle,
        'openedJobId': _openedJobId,
        'jobDescription': _jobDescription,
        'currency': _currency,
        'status': _status,
        'lowerRangeSalary': _lowerRangeSalary,
        'upperRangeSalary': _upperRangeSalary,
        'index': _index,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'department': serializeParam(
          _department,
          ParamType.String,
        ),
        'Job_title': serializeParam(
          _jobTitle,
          ParamType.String,
        ),
        'openedJobId': serializeParam(
          _openedJobId,
          ParamType.String,
        ),
        'jobDescription': serializeParam(
          _jobDescription,
          ParamType.String,
        ),
        'currency': serializeParam(
          _currency,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'lowerRangeSalary': serializeParam(
          _lowerRangeSalary,
          ParamType.int,
        ),
        'upperRangeSalary': serializeParam(
          _upperRangeSalary,
          ParamType.int,
        ),
        'index': serializeParam(
          _index,
          ParamType.int,
        ),
      }.withoutNulls;

  static ReferralDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ReferralDataStruct(
        department: deserializeParam(
          data['department'],
          ParamType.String,
          false,
        ),
        jobTitle: deserializeParam(
          data['Job_title'],
          ParamType.String,
          false,
        ),
        openedJobId: deserializeParam(
          data['openedJobId'],
          ParamType.String,
          false,
        ),
        jobDescription: deserializeParam(
          data['jobDescription'],
          ParamType.String,
          false,
        ),
        currency: deserializeParam(
          data['currency'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        lowerRangeSalary: deserializeParam(
          data['lowerRangeSalary'],
          ParamType.int,
          false,
        ),
        upperRangeSalary: deserializeParam(
          data['upperRangeSalary'],
          ParamType.int,
          false,
        ),
        index: deserializeParam(
          data['index'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ReferralDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ReferralDataStruct &&
        department == other.department &&
        jobTitle == other.jobTitle &&
        openedJobId == other.openedJobId &&
        jobDescription == other.jobDescription &&
        currency == other.currency &&
        status == other.status &&
        lowerRangeSalary == other.lowerRangeSalary &&
        upperRangeSalary == other.upperRangeSalary &&
        index == other.index;
  }

  @override
  int get hashCode => const ListEquality().hash([
        department,
        jobTitle,
        openedJobId,
        jobDescription,
        currency,
        status,
        lowerRangeSalary,
        upperRangeSalary,
        index
      ]);
}

ReferralDataStruct createReferralDataStruct({
  String? department,
  String? jobTitle,
  String? openedJobId,
  String? jobDescription,
  String? currency,
  String? status,
  int? lowerRangeSalary,
  int? upperRangeSalary,
  int? index,
}) =>
    ReferralDataStruct(
      department: department,
      jobTitle: jobTitle,
      openedJobId: openedJobId,
      jobDescription: jobDescription,
      currency: currency,
      status: status,
      lowerRangeSalary: lowerRangeSalary,
      upperRangeSalary: upperRangeSalary,
      index: index,
    );
