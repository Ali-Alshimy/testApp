import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class SelfServiceBlueThemeAuthUser {
  SelfServiceBlueThemeAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserDataStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<SelfServiceBlueThemeAuthUser>
    selfServiceBlueThemeAuthUserSubject =
    BehaviorSubject.seeded(SelfServiceBlueThemeAuthUser(loggedIn: false));
Stream<SelfServiceBlueThemeAuthUser> selfServiceBlueThemeAuthUserStream() =>
    selfServiceBlueThemeAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
