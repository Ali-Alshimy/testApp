// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserDataStruct extends BaseStruct {
  UserDataStruct({
    String? apiKey,
    String? apiSecret,
    String? id,
    String? jopTitle,
    int? servicePeriod,
    String? fullName,
    String? image,
    String? department,
    int? servicePeriodYears,
    String? email,
    int? debugMode,
    String? manger,
    double? faceDetection,
    String? company,
    String? checkout,
    String? checkin,
  })  : _apiKey = apiKey,
        _apiSecret = apiSecret,
        _id = id,
        _jopTitle = jopTitle,
        _servicePeriod = servicePeriod,
        _fullName = fullName,
        _image = image,
        _department = department,
        _servicePeriodYears = servicePeriodYears,
        _email = email,
        _debugMode = debugMode,
        _manger = manger,
        _faceDetection = faceDetection,
        _company = company,
        _checkout = checkout,
        _checkin = checkin;

  // "apiKey" field.
  String? _apiKey;
  String get apiKey => _apiKey ?? '';
  set apiKey(String? val) => _apiKey = val;

  bool hasApiKey() => _apiKey != null;

  // "apiSecret" field.
  String? _apiSecret;
  String get apiSecret => _apiSecret ?? '';
  set apiSecret(String? val) => _apiSecret = val;

  bool hasApiSecret() => _apiSecret != null;

  // "ID" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "jopTitle" field.
  String? _jopTitle;
  String get jopTitle => _jopTitle ?? '';
  set jopTitle(String? val) => _jopTitle = val;

  bool hasJopTitle() => _jopTitle != null;

  // "servicePeriod" field.
  int? _servicePeriod;
  int get servicePeriod => _servicePeriod ?? 0;
  set servicePeriod(int? val) => _servicePeriod = val;

  void incrementServicePeriod(int amount) =>
      servicePeriod = servicePeriod + amount;

  bool hasServicePeriod() => _servicePeriod != null;

  // "fullName" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  set fullName(String? val) => _fullName = val;

  bool hasFullName() => _fullName != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "department" field.
  String? _department;
  String get department => _department ?? '';
  set department(String? val) => _department = val;

  bool hasDepartment() => _department != null;

  // "service_period_years" field.
  int? _servicePeriodYears;
  int get servicePeriodYears => _servicePeriodYears ?? 0;
  set servicePeriodYears(int? val) => _servicePeriodYears = val;

  void incrementServicePeriodYears(int amount) =>
      servicePeriodYears = servicePeriodYears + amount;

  bool hasServicePeriodYears() => _servicePeriodYears != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "DebugMode" field.
  int? _debugMode;
  int get debugMode => _debugMode ?? 0;
  set debugMode(int? val) => _debugMode = val;

  void incrementDebugMode(int amount) => debugMode = debugMode + amount;

  bool hasDebugMode() => _debugMode != null;

  // "manger" field.
  String? _manger;
  String get manger => _manger ?? '';
  set manger(String? val) => _manger = val;

  bool hasManger() => _manger != null;

  // "faceDetection" field.
  double? _faceDetection;
  double get faceDetection => _faceDetection ?? 0.0;
  set faceDetection(double? val) => _faceDetection = val;

  void incrementFaceDetection(double amount) =>
      faceDetection = faceDetection + amount;

  bool hasFaceDetection() => _faceDetection != null;

  // "company" field.
  String? _company;
  String get company => _company ?? '';
  set company(String? val) => _company = val;

  bool hasCompany() => _company != null;

  // "checkout" field.
  String? _checkout;
  String get checkout => _checkout ?? '';
  set checkout(String? val) => _checkout = val;

  bool hasCheckout() => _checkout != null;

  // "checkin" field.
  String? _checkin;
  String get checkin => _checkin ?? '';
  set checkin(String? val) => _checkin = val;

  bool hasCheckin() => _checkin != null;

  static UserDataStruct fromMap(Map<String, dynamic> data) => UserDataStruct(
        apiKey: data['apiKey'] as String?,
        apiSecret: data['apiSecret'] as String?,
        id: data['ID'] as String?,
        jopTitle: data['jopTitle'] as String?,
        servicePeriod: castToType<int>(data['servicePeriod']),
        fullName: data['fullName'] as String?,
        image: data['image'] as String?,
        department: data['department'] as String?,
        servicePeriodYears: castToType<int>(data['service_period_years']),
        email: data['email'] as String?,
        debugMode: castToType<int>(data['DebugMode']),
        manger: data['manger'] as String?,
        faceDetection: castToType<double>(data['faceDetection']),
        company: data['company'] as String?,
        checkout: data['checkout'] as String?,
        checkin: data['checkin'] as String?,
      );

  static UserDataStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserDataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'apiKey': _apiKey,
        'apiSecret': _apiSecret,
        'ID': _id,
        'jopTitle': _jopTitle,
        'servicePeriod': _servicePeriod,
        'fullName': _fullName,
        'image': _image,
        'department': _department,
        'service_period_years': _servicePeriodYears,
        'email': _email,
        'DebugMode': _debugMode,
        'manger': _manger,
        'faceDetection': _faceDetection,
        'company': _company,
        'checkout': _checkout,
        'checkin': _checkin,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'apiKey': serializeParam(
          _apiKey,
          ParamType.String,
        ),
        'apiSecret': serializeParam(
          _apiSecret,
          ParamType.String,
        ),
        'ID': serializeParam(
          _id,
          ParamType.String,
        ),
        'jopTitle': serializeParam(
          _jopTitle,
          ParamType.String,
        ),
        'servicePeriod': serializeParam(
          _servicePeriod,
          ParamType.int,
        ),
        'fullName': serializeParam(
          _fullName,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'department': serializeParam(
          _department,
          ParamType.String,
        ),
        'service_period_years': serializeParam(
          _servicePeriodYears,
          ParamType.int,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'DebugMode': serializeParam(
          _debugMode,
          ParamType.int,
        ),
        'manger': serializeParam(
          _manger,
          ParamType.String,
        ),
        'faceDetection': serializeParam(
          _faceDetection,
          ParamType.double,
        ),
        'company': serializeParam(
          _company,
          ParamType.String,
        ),
        'checkout': serializeParam(
          _checkout,
          ParamType.String,
        ),
        'checkin': serializeParam(
          _checkin,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserDataStruct(
        apiKey: deserializeParam(
          data['apiKey'],
          ParamType.String,
          false,
        ),
        apiSecret: deserializeParam(
          data['apiSecret'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['ID'],
          ParamType.String,
          false,
        ),
        jopTitle: deserializeParam(
          data['jopTitle'],
          ParamType.String,
          false,
        ),
        servicePeriod: deserializeParam(
          data['servicePeriod'],
          ParamType.int,
          false,
        ),
        fullName: deserializeParam(
          data['fullName'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        department: deserializeParam(
          data['department'],
          ParamType.String,
          false,
        ),
        servicePeriodYears: deserializeParam(
          data['service_period_years'],
          ParamType.int,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        debugMode: deserializeParam(
          data['DebugMode'],
          ParamType.int,
          false,
        ),
        manger: deserializeParam(
          data['manger'],
          ParamType.String,
          false,
        ),
        faceDetection: deserializeParam(
          data['faceDetection'],
          ParamType.double,
          false,
        ),
        company: deserializeParam(
          data['company'],
          ParamType.String,
          false,
        ),
        checkout: deserializeParam(
          data['checkout'],
          ParamType.String,
          false,
        ),
        checkin: deserializeParam(
          data['checkin'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserDataStruct &&
        apiKey == other.apiKey &&
        apiSecret == other.apiSecret &&
        id == other.id &&
        jopTitle == other.jopTitle &&
        servicePeriod == other.servicePeriod &&
        fullName == other.fullName &&
        image == other.image &&
        department == other.department &&
        servicePeriodYears == other.servicePeriodYears &&
        email == other.email &&
        debugMode == other.debugMode &&
        manger == other.manger &&
        faceDetection == other.faceDetection &&
        company == other.company &&
        checkout == other.checkout &&
        checkin == other.checkin;
  }

  @override
  int get hashCode => const ListEquality().hash([
        apiKey,
        apiSecret,
        id,
        jopTitle,
        servicePeriod,
        fullName,
        image,
        department,
        servicePeriodYears,
        email,
        debugMode,
        manger,
        faceDetection,
        company,
        checkout,
        checkin
      ]);
}

UserDataStruct createUserDataStruct({
  String? apiKey,
  String? apiSecret,
  String? id,
  String? jopTitle,
  int? servicePeriod,
  String? fullName,
  String? image,
  String? department,
  int? servicePeriodYears,
  String? email,
  int? debugMode,
  String? manger,
  double? faceDetection,
  String? company,
  String? checkout,
  String? checkin,
}) =>
    UserDataStruct(
      apiKey: apiKey,
      apiSecret: apiSecret,
      id: id,
      jopTitle: jopTitle,
      servicePeriod: servicePeriod,
      fullName: fullName,
      image: image,
      department: department,
      servicePeriodYears: servicePeriodYears,
      email: email,
      debugMode: debugMode,
      manger: manger,
      faceDetection: faceDetection,
      company: company,
      checkout: checkout,
      checkin: checkin,
    );
