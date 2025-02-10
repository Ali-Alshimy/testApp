import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
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
      if (prefs.containsKey('ff_UserData')) {
        try {
          final serializedData = prefs.getString('ff_UserData') ?? '{}';
          _UserData =
              UserDataStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _baseURL = prefs.getString('ff_baseURL') ?? _baseURL;
    });
    _safeInit(() {
      _deviceID = prefs.getString('ff_deviceID') ?? _deviceID;
    });
    _safeInit(() {
      _policy = prefs.getBool('ff_policy') ?? _policy;
    });
    _safeInit(() {
      _language = prefs.getBool('ff_language') ?? _language;
    });
    _safeInit(() {
      _CompanyPolicy = prefs.getBool('ff_CompanyPolicy') ?? _CompanyPolicy;
    });
    _safeInit(() {
      _loadEmail = prefs.getString('ff_loadEmail') ?? _loadEmail;
    });
    _safeInit(() {
      _DontShowagain = prefs.getBool('ff_DontShowagain') ?? _DontShowagain;
    });
    _safeInit(() {
      _checkin = prefs.getString('ff_checkin') ?? _checkin;
    });
    _safeInit(() {
      _checkout = prefs.getString('ff_checkout') ?? _checkout;
    });
    _safeInit(() {
      _password = prefs.getString('ff_password') ?? _password;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _sidebarIcon = '';
  String get sidebarIcon => _sidebarIcon;
  set sidebarIcon(String value) {
    _sidebarIcon = value;
  }

  String _readOnly = '';
  String get readOnly => _readOnly;
  set readOnly(String value) {
    _readOnly = value;
  }

  String _nameReadOnly = '';
  String get nameReadOnly => _nameReadOnly;
  set nameReadOnly(String value) {
    _nameReadOnly = value;
  }

  String _OnPressed = 'Personal';
  String get OnPressed => _OnPressed;
  set OnPressed(String value) {
    _OnPressed = value;
  }

  String _returnbiomatrex = '';
  String get returnbiomatrex => _returnbiomatrex;
  set returnbiomatrex(String value) {
    _returnbiomatrex = value;
  }

  UserDataStruct _UserData =
      UserDataStruct.fromSerializableMap(jsonDecode('{}'));
  UserDataStruct get UserData => _UserData;
  set UserData(UserDataStruct value) {
    _UserData = value;
    prefs.setString('ff_UserData', value.serialize());
  }

  void updateUserDataStruct(Function(UserDataStruct) updateFn) {
    updateFn(_UserData);
    prefs.setString('ff_UserData', _UserData.serialize());
  }

  String _baseURL = '';
  String get baseURL => _baseURL;
  set baseURL(String value) {
    _baseURL = value;
    prefs.setString('ff_baseURL', value);
  }

  bool _check = false;
  bool get check => _check;
  set check(bool value) {
    _check = value;
  }

  String _OnPressedInReq = 'Approved';
  String get OnPressedInReq => _OnPressedInReq;
  set OnPressedInReq(String value) {
    _OnPressedInReq = value;
  }

  int _drawer = 0;
  int get drawer => _drawer;
  set drawer(int value) {
    _drawer = value;
  }

  bool _getAnnualReq = false;
  bool get getAnnualReq => _getAnnualReq;
  set getAnnualReq(bool value) {
    _getAnnualReq = value;
  }

  String _deviceID = '';
  String get deviceID => _deviceID;
  set deviceID(String value) {
    _deviceID = value;
    prefs.setString('ff_deviceID', value);
  }

  String _dashboard = 'Working Hours';
  String get dashboard => _dashboard;
  set dashboard(String value) {
    _dashboard = value;
  }

  ErrorsStruct _errors = ErrorsStruct();
  ErrorsStruct get errors => _errors;
  set errors(ErrorsStruct value) {
    _errors = value;
  }

  void updateErrorsStruct(Function(ErrorsStruct) updateFn) {
    updateFn(_errors);
  }

  String _detailsErrors = '';
  String get detailsErrors => _detailsErrors;
  set detailsErrors(String value) {
    _detailsErrors = value;
  }

  bool _policy = false;
  bool get policy => _policy;
  set policy(bool value) {
    _policy = value;
    prefs.setBool('ff_policy', value);
  }

  bool _language = true;
  bool get language => _language;
  set language(bool value) {
    _language = value;
    prefs.setBool('ff_language', value);
  }

  bool _CompanyPolicy = false;
  bool get CompanyPolicy => _CompanyPolicy;
  set CompanyPolicy(bool value) {
    _CompanyPolicy = value;
    prefs.setBool('ff_CompanyPolicy', value);
  }

  String _loadEmail = '';
  String get loadEmail => _loadEmail;
  set loadEmail(String value) {
    _loadEmail = value;
    prefs.setString('ff_loadEmail', value);
  }

  String _fcmToken = '';
  String get fcmToken => _fcmToken;
  set fcmToken(String value) {
    _fcmToken = value;
  }

  int _numNotifications = 0;
  int get numNotifications => _numNotifications;
  set numNotifications(int value) {
    _numNotifications = value;
  }

  bool _DontShowagain = false;
  bool get DontShowagain => _DontShowagain;
  set DontShowagain(bool value) {
    _DontShowagain = value;
    prefs.setBool('ff_DontShowagain', value);
  }

  String _checkin = '';
  String get checkin => _checkin;
  set checkin(String value) {
    _checkin = value;
    prefs.setString('ff_checkin', value);
  }

  String _checkout = '';
  String get checkout => _checkout;
  set checkout(String value) {
    _checkout = value;
    prefs.setString('ff_checkout', value);
  }

  String _password = '';
  String get password => _password;
  set password(String value) {
    _password = value;
    prefs.setString('ff_password', value);
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
