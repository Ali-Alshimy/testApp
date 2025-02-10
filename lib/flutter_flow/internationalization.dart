import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // loginPage
  {
    'qchxsfy0': {
      'en': 'Talentio',
      'ar': 'Talentio',
    },
    'omiqp66w': {
      'en': 'Setting Page',
      'ar': 'صفحة الإعداد',
    },
    'cxh6s5f3': {
      'en': 'Get Started.',
      'ar': 'البدء.',
    },
    'ce3w1awn': {
      'en': 'Let\'s get started by filling out the form below.',
      'ar': 'لنبدأ بملء النموذج أدناه.',
    },
    'dknkidaq': {
      'en': 'URL',
      'ar': 'الرابط',
    },
    'mae4un7d': {
      'en': ' https://example.com',
      'ar': ' https://example.com',
    },
    'aqdxqjze': {
      'en': 'Get Started',
      'ar': 'البدء',
    },
    'zvdg0hr5': {
      'en': 'Log In',
      'ar': 'الدخول',
    },
    'yqjjs36r': {
      'en': 'Welcome Back',
      'ar': 'أهلا بعودتك',
    },
    'ike7bmv9': {
      'en': 'Fill out the information below in order to access your account.',
      'ar': 'قم بملء المعلومات أدناه للوصول إلى حسابك.',
    },
    'c8st9zhv': {
      'en': 'Email',
      'ar': 'البريد الإلكتروني',
    },
    'br1xjqks': {
      'en': 'example@example.com',
      'ar': 'example@example.com',
    },
    'tq6ghuhe': {
      'en': 'Password',
      'ar': 'كلمة السر',
    },
    '6maour8p': {
      'en': '••••••••',
      'ar': '••••••••',
    },
    'f6mq0kne': {
      'en': 'This field is required',
      'ar': 'هذا الحقل مطلوب',
    },
    '9bk4ydxj': {
      'en': ' Please enter a valid email address',
      'ar': ' الرجاء إدخال بريد إلكتروني صالح',
    },
    'nj932jxq': {
      'en': 'Email max 320 characters',
      'ar': 'البريد الإلكتروني بحد أقصى 320 حرفًا',
    },
    'cso9k2wc': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'Please choose an option from the dropdown',
    },
    'a5x66ka0': {
      'en': 'This field is required',
      'ar': 'هذا الحقل مطلوب',
    },
    'n4sr14zo': {
      'en': 'Password must have 8 characters',
      'ar': 'يجب أن تحتوي كلمة المرور على 8 أحرف',
    },
    'a0mygk8m': {
      'en': 'Password max 320 characters',
      'ar': 'كلمة السر بحد أقصى 50 حرفًا',
    },
    '5edy099m': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'Please choose an option from the dropdown',
    },
    '3bqqztgg': {
      'en': 'Sign In',
      'ar': 'تسجيل الدخول',
    },
    'zfr1k45r': {
      'en': 'Forgot Password?',
      'ar': 'هل نسيت كلمة السر؟',
    },
    'fqfyet7s': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // WelcomePageCopy
  {
    '4osbbr8s': {
      'en': 'Get Started',
      'ar': 'البدء',
    },
    'f6ih40pj': {
      'en': 'Version : ',
      'ar': 'الأصدار : ',
    },
    '5fumnc2z': {
      'en': 'Powered By Golive-Solutions',
      'ar': 'طور بواسطة  Golive-Solutions',
    },
    'dmznvsib': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // HomePage
  {
    'd05k1a8j': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
    'i9y8j2s9': {
      'en': 'Welcome Back !',
      'ar': 'أهلا بعودتك',
    },
    '0erkd6gg': {
      'en': 'Name: ',
      'ar': 'الأسم :',
    },
    'w4gporx5': {
      'en': 'Service Period : ',
      'ar': 'فترة الخدمة :',
    },
    'ypms76qr': {
      'en': 'Job Title: ',
      'ar': 'المسمى الوظيفى :',
    },
    '3h2omani': {
      'en': 'Employee id: ',
      'ar': 'الرقم التعريفى :',
    },
    'vc6fcxkr': {
      'en': 'Direct Manager: ',
      'ar': 'المدير المباشر:',
    },
    'jb9xnvog': {
      'en': 'More',
      'ar': 'المزيد',
    },
    '1zz76hfs': {
      'en': 'Check Out',
      'ar': 'الخروج',
    },
    'or55bz7s': {
      'en': 'Check In ',
      'ar': ' الدخول',
    },
    'lh0ue855': {
      'en': 'Attendance',
      'ar': 'الحضور',
    },
    'kgokbuq2': {
      'en': 'Last Salary',
      'ar': 'أخر راتب',
    },
    'cuh68axg': {
      'en': 'Annual ',
      'ar': 'سنوى',
    },
    '6s0hgdw2': {
      'en': 'sick',
      'ar': 'مرضي',
    },
    'png471y6': {
      'en': 'Loan',
      'ar': 'قرض',
    },
    'gicvyntl': {
      'en': 'OverTime',
      'ar': 'الوقت الإضافي',
    },
    '4kop4zjv': {
      'en': 'recent transactions',
      'ar': 'المعاملات الأخيرة',
    },
    '4ycigs1f': {
      'en': 'recent transactions',
      'ar': 'المعاملات الأخيرة',
    },
    'g6xugbsd': {
      'en': 'MyTeam',
      'ar': 'فريقي',
    },
    'nr3noo43': {
      'en': 'Onboarding',
      'ar': 'التعيينات',
    },
    '71cq0jqq': {
      'en': 'DashBoard',
      'ar': 'الرسم البياني',
    },
    'merc9oib': {
      'en': 'Referral',
      'ar': 'الترشيح',
    },
    '1kijpx6r': {
      'en': 'Approvals ',
      'ar': 'الموافقات',
    },
    '6t222sun': {
      'en': 'Logout',
      'ar': 'تسجيل الخروج',
    },
    'l92d5a1x': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // NewtransactionPage
  {
    'isugqyy3': {
      'en': 'New Transaction',
      'ar': 'طلب جديد',
    },
    'ay5j5xs5': {
      'en': 'New Request',
      'ar': 'طلب جديد',
    },
    'y3h6hj4v': {
      'en': 'New REQ',
      'ar': 'طلب جديد',
    },
  },
  // MyTransactionsPage
  {
    'dbiey4lf': {
      'en': 'My Requests',
      'ar': 'طلباتي',
    },
    '4mqzezgy': {
      'en': 'My Transaction ',
      'ar': 'طلباتي',
    },
    'j7lo77lz': {
      'en': 'My REQ',
      'ar': 'طلباتي',
    },
  },
  // ProfilePage
  {
    'eucwfgfi': {
      'en': 'Profile',
      'ar': 'الملف الشخصي',
    },
    'bnqj1hhh': {
      'en': 'Personal',
      'ar': 'شخصي',
    },
    'ybm13ogj': {
      'en': 'Salary',
      'ar': 'الراتب',
    },
    '09tkkj8p': {
      'en': 'Select  Year',
      'ar': 'اختيار السنة',
    },
    'dpgubltw': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '37ohp18o': {
      'en': '2024',
      'ar': '2024',
    },
    'sx0f1mr3': {
      'en': 'Select  Month',
      'ar': 'اختيار الشهر',
    },
    '6oei06zb': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'dk5sd0k1': {
      'en': 'Notifications',
      'ar': 'الإشعارات',
    },
  },
  // AttendancePage
  {
    'mjg15h72': {
      'en': 'Time Attendance',
      'ar': 'وقت الحضور',
    },
    '8v7zb3ww': {
      'en': 'Attendance',
      'ar': 'الحضور',
    },
  },
  // OnboardingPage
  {
    'gwsdb3o3': {
      'en': 'Name :',
      'ar': 'الأسم :',
    },
    'sgmkdgc6': {
      'en': 'Id :',
      'ar': 'الرقم التعريفى :',
    },
    'fsoonqr6': {
      'en': 'Job Title :',
      'ar': 'المسمي الوظيفى :',
    },
    'h8865t33': {
      'en': 'Department :',
      'ar': 'القسم : ',
    },
    'fuzrywwe': {
      'en': 'Start Join :',
      'ar': 'تاريخ الإنضمام :',
    },
    '0gxb3h8b': {
      'en': 'Onboarding ',
      'ar': 'التعيينات',
    },
    'ruj2kult': {
      'en': 'Home',
      'ar': ' الصفحة الرئيسية',
    },
  },
  // MyTeamPage
  {
    'xnbme2wq': {
      'en': 'My Team',
      'ar': 'فريقي',
    },
    'whxwj0tr': {
      'en': 'Head Count : ',
      'ar': 'عدد الفريق  : ',
    },
    'd3qwxk84': {
      'en': 'Name : ',
      'ar': 'الأسم : ',
    },
    'xxw3gmn2': {
      'en': 'ID : ',
      'ar': 'الرقم التعريفى :',
    },
    'xm6pk5qr': {
      'en': 'Email:',
      'ar': 'البريد إلكترونى :',
    },
    'oxpgy1c1': {
      'en': 'Number:',
      'ar': 'الرقم :',
    },
    'm3j40rth': {
      'en': 'Status :',
      'ar': 'الحالة:',
    },
    'uqdqs3b5': {
      'en': 'Job Title:',
      'ar': 'المسمى الوظيفى :',
    },
    'rbggtt86': {
      'en': 'Address:',
      'ar': 'العنوان :',
    },
    '220j6zsj': {
      'en': 'Home',
      'ar': ' الصفحة الرئيسية',
    },
  },
  // NotificationPage
  {
    'ryczqjnk': {
      'en': 'Notifications',
      'ar': 'الأشعارات',
    },
    '6zgnhtkz': {
      'en': 'All Read',
      'ar': 'قراءة الكل',
    },
    '4fjofj7r': {
      'en': 'No notifications ',
      'ar': 'لا يوجد أشعارات',
    },
    'tydwhy58': {
      'en': 'No notifications ',
      'ar': 'لا يوجد أشعارات',
    },
    '875laey3': {
      'en': 'Notification ',
      'ar': 'إشعار',
    },
  },
  // ApprovalPage
  {
    '6m307mfy': {
      'en': 'Approval',
      'ar': 'الموافقات',
    },
    'ypjkuk2z': {
      'en': 'HR Requests',
      'ar': 'طلبات الموارد البشرية',
    },
    '9bhsw7ak': {
      'en': 'Leave Application',
      'ar': 'Leave Application',
    },
    'nxscxqj5': {
      'en': 'Loan Application',
      'ar': 'Loan Application',
    },
    'u2rz1umw': {
      'en': 'Expense Claim',
      'ar': 'Expense Claim',
    },
    '3b5i8vqj': {
      'en': 'Overtime Request',
      'ar': 'Overtime Request',
    },
    '0xtmx3su': {
      'en': 'Training Request',
      'ar': 'Training Request',
    },
    '7lq3m32c': {
      'en': 'Shift Request',
      'ar': 'Shift Request',
    },
    'ca0ezf8z': {
      'en': 'Attendance Request',
      'ar': 'Attendance Request',
    },
    'ghzpagaa': {
      'en': 'Leave Application',
      'ar': 'Leave Application',
    },
    'oecjzgmo': {
      'en': 'Other\'s ',
      'ar': 'أخرى',
    },
    'l11g4c9q': {
      'en': 'Home',
      'ar': ' الصفحة الرئيسية',
    },
  },
  // Contact-InfoPage
  {
    'd3ob1ow9': {
      'en': 'Contact Info',
      'ar': 'معلومات الاتصال',
    },
    '72wgrvkf': {
      'en': 'Id:',
      'ar': 'الرقم التعريفى :',
    },
    'wj0jwxgf': {
      'en': 'Personal',
      'ar': 'شخصي',
    },
    'ruzrsjm7': {
      'en': 'Company',
      'ar': 'الشركة',
    },
    'ue06wt0r': {
      'en': 'Education',
      'ar': 'التعليم',
    },
    'i6l932ga': {
      'en': 'Personal',
      'ar': 'شخصي',
    },
    '9sm739sb': {
      'en': 'First Name:',
      'ar': 'الاسم الاول:',
    },
    'i047p83c': {
      'en': 'Middle Name:',
      'ar': 'الاسم الاوسط:',
    },
    'u6262h96': {
      'en': 'Date of Birth:',
      'ar': 'تاريخ الميلاد:',
    },
    'xl0uhjbh': {
      'en': 'Gender:',
      'ar': 'الجنس:',
    },
    'b66h0v96': {
      'en': 'Mobile:',
      'ar': 'الموبايل:',
    },
    'dp20w6js': {
      'en': 'Email:',
      'ar': 'البريد الاكتروني:',
    },
    'sfql89mg': {
      'en': 'Address:',
      'ar': 'العنوان:',
    },
    'qrp0wly3': {
      'en': 'Marital Status:',
      'ar': 'الحالة الاجتماعية:',
    },
    'fzk3c03o': {
      'en': 'Date of join:',
      'ar': 'تاريخ الانضمام:',
    },
    'kvta70eo': {
      'en': 'Designation:',
      'ar': 'التعيين:',
    },
    'g9ga8hcr': {
      'en': 'Status:',
      'ar': 'الحالة:',
    },
    '7cjanaql': {
      'en': 'Branch:',
      'ar': 'الفرع:',
    },
    'amzi30m6': {
      'en': 'Department:',
      'ar': 'القسم:',
    },
    'casc31z0': {
      'en': 'Employment Type:',
      'ar': 'نوع الوظيفة:',
    },
    '14dsbrk4': {
      'en': 'Email:',
      'ar': 'البريد الاكتروني:',
    },
    'c86k3eaj': {
      'en': 'Default Shift:',
      'ar': 'ميعاد العمل:',
    },
    '1ydf9cbn': {
      'en': 'HIP:',
      'ar': 'HIP:',
    },
    'mm3ytytg': {
      'en': 'Holiday List:',
      'ar': 'العطلات:',
    },
    '2b0z49n5': {
      'en': 'School/University:',
      'ar': 'المدرسة/الجامعة:',
    },
    '7j17n378': {
      'en': 'qualification:',
      'ar': 'المؤهل:',
    },
    '3v8u90bl': {
      'en': 'Level:',
      'ar': 'المستوى:',
    },
    '697lfqlr': {
      'en': 'Year of passing:',
      'ar': 'سنة التخرج:',
    },
    '1o5twsob': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // ReferralDetailsPage
  {
    'kcogoz7g': {
      'en': 'Referral Details ',
      'ar': 'تفاصيل الترشيح',
    },
    'cle0jovi': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // BankDetailsPage
  {
    'qxob1y7z': {
      'en': 'Bank Details ',
      'ar': 'التفاصيل المصرفية',
    },
    'zc1dxt2l': {
      'en': 'Home',
      'ar': 'الصفحة  الرئيسية',
    },
  },
  // annual
  {
    'l6dce4n0': {
      'en': 'Annual',
      'ar': 'السنوي',
    },
    'rr8hqay0': {
      'en': '',
      'ar': '',
    },
    'ir0v0o2v': {
      'en': 'Status',
      'ar': 'الحالة',
    },
    'j8h0w570': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    't22c5d15': {
      'en': '',
      'ar': '',
    },
    'k4fkgws1': {
      'en': 'Time Period',
      'ar': 'الفترة الزمنية',
    },
    'h5xagds3': {
      'en': 'Search for an item...',
      'ar': '',
    },
    '1aj2fkbn': {
      'en': 'This Week',
      'ar': 'هذا الأسبوع',
    },
    'i2gsu6fb': {
      'en': 'This Month',
      'ar': 'هذا الشهر',
    },
    'eqcac2ia': {
      'en': 'This Year',
      'ar': 'هذه السنة ',
    },
    'mzr7w3h0': {
      'en': 'Custom',
      'ar': 'مخصص',
    },
    'lmnlfw8f': {
      'en': 'From',
      'ar': 'من ',
    },
    '6ayzzvh4': {
      'en': ':',
      'ar': '',
    },
    'qqt3ljr7': {
      'en': 'To',
      'ar': 'الى',
    },
    'srfiv6q8': {
      'en': ':',
      'ar': '',
    },
    'hvwpighs': {
      'en': 'Name:',
      'ar': 'الأسم:',
    },
    'drq8a665': {
      'en': 'Job Title:',
      'ar': 'المسمي الوظيفى:',
    },
    'y4gz2dri': {
      'en': 'Department:',
      'ar': 'القسم:',
    },
    'b2rsjlv6': {
      'en': 'Annual Type:',
      'ar': 'نوع الأجازة: ',
    },
    '12doslwe': {
      'en': 'Attendance Date:',
      'ar': 'تاريخ الحضور:',
    },
    'b0y9rksq': {
      'en': 'Reason:',
      'ar': 'السبب:',
    },
    'bfgpmjxw': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // Finance_Claim
  {
    'fhc95l0j': {
      'en': 'Finance Claims ',
      'ar': 'تسوية  المصروفات',
    },
    'ausiltbu': {
      'en': '',
      'ar': '',
    },
    '7hxpii0i': {
      'en': 'Status',
      'ar': 'الحالة',
    },
    't8y9ngyq': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'tx89oad7': {
      'en': '',
      'ar': '',
    },
    'deecdxys': {
      'en': 'Time Period',
      'ar': 'الفترة الزمنية',
    },
    'uu7ysb91': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'o6o196jo': {
      'en': 'This Week',
      'ar': 'هذا الأسبوع',
    },
    'lpdz62hh': {
      'en': 'This Month',
      'ar': 'هذا الشهر',
    },
    '79ct9bk4': {
      'en': 'This Year',
      'ar': 'هذه السنة ',
    },
    '74liq31n': {
      'en': 'Custom',
      'ar': 'مخصص',
    },
    'fddsefs5': {
      'en': 'From',
      'ar': 'من ',
    },
    'xycdf22j': {
      'en': ':',
      'ar': '',
    },
    'gi8glc1g': {
      'en': 'To',
      'ar': 'الى',
    },
    'wdpnt8tt': {
      'en': ':',
      'ar': '',
    },
    '92onz80w': {
      'en': 'Name:',
      'ar': 'الأسم:',
    },
    'v89m5q22': {
      'en': 'Job Title:',
      'ar': 'المسمي الوظيفى:',
    },
    'sl2uxus5': {
      'en': 'Department:',
      'ar': 'القسم:',
    },
    'g63gra9f': {
      'en': 'Claim Type:',
      'ar': 'نوع المطالبة:',
    },
    'bf2fiduf': {
      'en': 'Posting Date:',
      'ar': 'تاريخ الطلب:',
    },
    'yygp17le': {
      'en': 'Allowed:',
      'ar': 'المسموح:',
    },
    'l87zbuoo': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // Leaves
  {
    '4my0p9d6': {
      'en': 'Leaves',
      'ar': ' أجازات',
    },
    'tik8erik': {
      'en': '',
      'ar': '',
    },
    'ngac7ams': {
      'en': 'Status',
      'ar': 'الحالة',
    },
    'yj5wufbu': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '2k2a605u': {
      'en': '',
      'ar': '',
    },
    '52a61rlf': {
      'en': 'Time Period',
      'ar': 'الفترة الزمنية',
    },
    '2n0k5ezw': {
      'en': 'Search for an item...',
      'ar': 'ابحث عن عنصر...',
    },
    'u8i5npvv': {
      'en': 'This Week',
      'ar': 'هذا الأسبوع',
    },
    'a5nbjrt3': {
      'en': 'This Month',
      'ar': 'هذا الشهر',
    },
    'msjm55fm': {
      'en': 'This Year',
      'ar': 'هذه السنة',
    },
    's5mz5jzj': {
      'en': 'Custom',
      'ar': 'مخصص',
    },
    's2e3aikh': {
      'en': 'From',
      'ar': 'من',
    },
    'dpyak4au': {
      'en': ':',
      'ar': ':',
    },
    'qyuztrxg': {
      'en': 'To',
      'ar': 'الى',
    },
    'm8ahup0m': {
      'en': ':',
      'ar': ':',
    },
    't913x0vj': {
      'en': 'Name:',
      'ar': 'الأسم:',
    },
    'yzpkfqei': {
      'en': 'Job Title:',
      'ar': 'المسمي الوظيفى:',
    },
    'f3gbc2gb': {
      'en': 'Department:',
      'ar': 'القسم:',
    },
    'hu6aot2r': {
      'en': 'Leave Type:',
      'ar': 'نوع المغادرة:',
    },
    'dz553qu6': {
      'en': 'Attendance Date:',
      'ar': 'تاريخ الطلب:',
    },
    '7avkpjtu': {
      'en': 'Reason:',
      'ar': 'السبب:',
    },
    'rjteh3cs': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // loans
  {
    '3pjqmfz4': {
      'en': 'Loans ',
      'ar': 'السلف',
    },
    'fhluftvy': {
      'en': '',
      'ar': '',
    },
    'scno2dme': {
      'en': 'Status',
      'ar': 'الحالة',
    },
    'solvf1v4': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'v3618gpd': {
      'en': '',
      'ar': '',
    },
    '8zrtxx8d': {
      'en': 'Time Period',
      'ar': 'الفترة الزمنية',
    },
    'w1vcgoni': {
      'en': 'Search for an item...',
      'ar': 'ابحث عن عنصر...',
    },
    'uuo6chsa': {
      'en': 'This Week',
      'ar': 'هذا الأسبوع',
    },
    'gbattana': {
      'en': 'This Month',
      'ar': 'هذا الشهر',
    },
    '5v4mrv1p': {
      'en': 'This Year',
      'ar': 'هذا الشهر',
    },
    '857d3kzy': {
      'en': 'Custom',
      'ar': 'هذه السنة',
    },
    '2e8l549y': {
      'en': 'From',
      'ar': 'من',
    },
    'xr6uyzou': {
      'en': ':',
      'ar': ':',
    },
    '60fnmkmd': {
      'en': 'To',
      'ar': 'الى',
    },
    'ab25gazr': {
      'en': ':',
      'ar': ':',
    },
    'ia7j9w90': {
      'en': 'Name:',
      'ar': 'الأسم:',
    },
    'lko439pn': {
      'en': 'Job Title:',
      'ar': 'المسمي الوظيفى:',
    },
    'zji90are': {
      'en': 'Department:',
      'ar': 'القسم:',
    },
    '5ks1uc4w': {
      'en': 'Loan Type:',
      'ar': 'نوع السلف:',
    },
    '0dnp7g7j': {
      'en': 'Loan Amount:',
      'ar': 'مبلغ السلف:',
    },
    '3ip4a9mp': {
      'en': 'Repayment Periods:',
      'ar': 'فترات السداد:',
    },
    'o36feil2': {
      'en': 'Repayment Amount:',
      'ar': 'مبلغ السداد:',
    },
    'keqfpjwa': {
      'en': 'Date:',
      'ar': 'التاريخ:',
    },
    'd0tsxxqy': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // overTimePage
  {
    'fptn7o44': {
      'en': 'Overtime',
      'ar': 'إضافي',
    },
    'yjshdngz': {
      'en': '',
      'ar': '',
    },
    '8z7koj5i': {
      'en': 'Status',
      'ar': 'الحالة',
    },
    '6izoyuvj': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'u5rfnt2n': {
      'en': '',
      'ar': '',
    },
    'gcnb1yt9': {
      'en': 'Time Period',
      'ar': 'الفترة الزمنية',
    },
    'nwmvvsoo': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'wb80rew9': {
      'en': 'This Week',
      'ar': 'هذا الأسبوع',
    },
    'qlipmkob': {
      'en': 'This Month',
      'ar': 'هذا الأسبوع',
    },
    'btd0cun1': {
      'en': 'This Year',
      'ar': 'هذه السنة',
    },
    'nrvg9ggj': {
      'en': 'Custom',
      'ar': 'مخصص',
    },
    'i63xzmp2': {
      'en': 'From',
      'ar': 'من ',
    },
    'x5ftkmtr': {
      'en': ':',
      'ar': ':',
    },
    'xxgw9lv5': {
      'en': 'To',
      'ar': 'الى',
    },
    'c6km5nyg': {
      'en': ':',
      'ar': ':',
    },
    'g3gpvhoi': {
      'en': 'Name:',
      'ar': 'الأسم:',
    },
    'g56id4no': {
      'en': 'Job Title:',
      'ar': 'المسمي الوظيفى:',
    },
    '7iad9tnm': {
      'en': 'Department:',
      'ar': 'القسم:',
    },
    '464qun3j': {
      'en': 'OverTime Type:',
      'ar': 'نوع العمل الإضافي:',
    },
    's962dna9': {
      'en': 'OverTime Hour\'s:',
      'ar': 'ساعات العمل الإضافي:',
    },
    'r643nh8a': {
      'en': 'Attendance Date:',
      'ar': 'تاريخ الحضور:',
    },
    'pk6bf7tq': {
      'en': 'Reason:',
      'ar': 'السبب:',
    },
    '0fo1bkzm': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // training
  {
    'zoekefii': {
      'en': 'Training',
      'ar': 'التدريب ',
    },
    'gs4fjpsj': {
      'en': '',
      'ar': '',
    },
    'isxpw0xv': {
      'en': 'Status',
      'ar': 'الحالة:',
    },
    'sqtvbaqh': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'nvlkaxq7': {
      'en': '',
      'ar': '',
    },
    'j6wxqceq': {
      'en': 'Time Period',
      'ar': 'الفترة الزمنية',
    },
    'h8xeci5q': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'za5zhyme': {
      'en': 'This Week',
      'ar': 'هذا الأسبوع',
    },
    'wzz0529p': {
      'en': 'This Month',
      'ar': 'هذا الشهر',
    },
    '6nsv14e7': {
      'en': 'This Year',
      'ar': 'هذا  السنة',
    },
    '0mv2mnw6': {
      'en': 'Custom',
      'ar': 'مخصص',
    },
    'z0tn9mv4': {
      'en': 'From',
      'ar': 'من',
    },
    'y6rtapj9': {
      'en': ':',
      'ar': ':',
    },
    'm8hm2m8t': {
      'en': 'To',
      'ar': 'الى',
    },
    '3uasclzg': {
      'en': ':',
      'ar': ':',
    },
    '0arv942b': {
      'en': 'Name:',
      'ar': 'الأسم:',
    },
    'rtglsctf': {
      'en': 'Job Title:',
      'ar': 'المسمي الوظيفى:',
    },
    'ghhm98kc': {
      'en': 'Department:',
      'ar': 'القسم:',
    },
    'a6x5dtew': {
      'en': 'Program Type:',
      'ar': 'نوع البرنامج:',
    },
    'yjp9exi8': {
      'en': 'Attendance Date:',
      'ar': 'تاريخ الطلب:',
    },
    '98zwahz7': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // misc
  {
    'andnj1s0': {
      'en': 'Miscellaneous ',
      'ar': 'طلبات إدارية',
    },
    '5qioklrl': {
      'en': '',
      'ar': '',
    },
    'arepx8dd': {
      'en': 'Status',
      'ar': 'الحالة',
    },
    'agf3fjlo': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'c3z30res': {
      'en': '',
      'ar': '',
    },
    '1ia0axob': {
      'en': 'Time Period',
      'ar': 'الفترة الزمنية',
    },
    'ry1k9haz': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'bj1v37h0': {
      'en': 'This Week',
      'ar': 'هذا الأسبوع',
    },
    'u14hjs53': {
      'en': 'This Month',
      'ar': 'هذا الشهر',
    },
    'mj096d2c': {
      'en': 'This Year',
      'ar': 'هذه السنة',
    },
    'wvvtbwo5': {
      'en': 'Custom',
      'ar': 'مخصص',
    },
    '8y3nt6cz': {
      'en': 'From',
      'ar': 'من',
    },
    'u5dt2w6v': {
      'en': ':',
      'ar': ':',
    },
    '530yfaft': {
      'en': 'To',
      'ar': 'الى',
    },
    'h2doob1o': {
      'en': ':',
      'ar': ':',
    },
    'lt9oxy2x': {
      'en': 'Name :',
      'ar': 'الأسم :',
    },
    'oq7y456r': {
      'en': 'Job Title :',
      'ar': 'المسمي الوظيفى:',
    },
    '3mk65wy6': {
      'en': 'Department :',
      'ar': 'القسم :',
    },
    'nvi5p489': {
      'en': 'Type :',
      'ar': 'النوع : ',
    },
    'sxgyzddu': {
      'en': 'Date :',
      'ar': 'التاريخ :',
    },
    'nzuhae9d': {
      'en': 'Explanation :',
      'ar': 'التوضيح :',
    },
    'jevgd7ld': {
      'en': 'allowed :',
      'ar': 'المسموح :',
    },
    '55z6u91w': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // AttachmentsPage
  {
    'suih7n61': {
      'en': 'Attachmentes ',
      'ar': 'المرفقات',
    },
    'db8vprzi': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // AttendanceHistoryPage
  {
    'd5ylde9x': {
      'en': 'Attendance History',
      'ar': 'تقرير الحضور',
    },
    'cycrs4p1': {
      'en': 'Date : ',
      'ar': 'التاريخ :',
    },
    'q9dx6jbw': {
      'en': 'Check in',
      'ar': 'الدخول',
    },
    '7xig3tij': {
      'en': 'Check Out',
      'ar': 'الخروج',
    },
    'vb3nyc1x': {
      'en': 'Working Hours: ',
      'ar': 'ساعات العمل:',
    },
    'lhqs8tvk': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // MissingAttendancePage
  {
    '2co6ijow': {
      'en': 'Missing Attendance',
      'ar': 'تقرير الغياب',
    },
    'hb0kunpw': {
      'en': 'Date : ',
      'ar': 'التاريخ :',
    },
    '02mku1v9': {
      'en': 'Check in',
      'ar': 'الدخول',
    },
    'loj9ikib': {
      'en': 'Check Out',
      'ar': 'الخروج',
    },
    '09w00r27': {
      'en': 'Request',
      'ar': 'الطلب',
    },
    '1kwdtpj7': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // Attandance
  {
    'm2w7khvg': {
      'en': 'Attendance Request',
      'ar': 'طلب الحضور',
    },
    '6xyvmw7r': {
      'en': '',
      'ar': '',
    },
    'fegpwfie': {
      'en': 'Status',
      'ar': 'الحالة',
    },
    'aobd9ypt': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'bokadv4b': {
      'en': '',
      'ar': '',
    },
    'jt15ynio': {
      'en': 'Time Period',
      'ar': 'الفترة الزمنية',
    },
    'u4c2mmyx': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'm4yd375g': {
      'en': 'This Week',
      'ar': 'هذا الأسبوع',
    },
    'f7galo4g': {
      'en': 'This Month',
      'ar': 'هذا الشهر',
    },
    '24psu2cz': {
      'en': 'This Year',
      'ar': 'هذه السنة ',
    },
    '3t10aaog': {
      'en': 'Custom',
      'ar': 'مخصص',
    },
    'mfvk74cf': {
      'en': 'From',
      'ar': 'من ',
    },
    'qbg31jf0': {
      'en': ':',
      'ar': '',
    },
    'szxjfv10': {
      'en': 'To',
      'ar': 'الى',
    },
    'q9e8zo9d': {
      'en': ':',
      'ar': '',
    },
    '058iu1ot': {
      'en': 'Name:',
      'ar': 'الأسم:',
    },
    '5qa462zo': {
      'en': 'Job Title:',
      'ar': 'المسمي الوظيفى:',
    },
    'e1uklcgo': {
      'en': 'Department:',
      'ar': 'القسم:',
    },
    'u0e7zhp7': {
      'en': 'Reason:',
      'ar': 'السبب:',
    },
    'y3bqx024': {
      'en': 'half day:',
      'ar': 'نصف يوم:',
    },
    'q1ncopiz': {
      'en': 'Explanation:',
      'ar': 'توضيح:',
    },
    'ilhk4ey3': {
      'en': 'Date:',
      'ar': 'التاريخ:',
    },
    'cni7f7i9': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // shift
  {
    'z4uwveus': {
      'en': 'Shift',
      'ar': 'تغيير الوردية',
    },
    'ywxqk1zb': {
      'en': '',
      'ar': '',
    },
    'blekogn3': {
      'en': 'Status',
      'ar': 'الحالة',
    },
    'eq9zfruo': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'eqjf5eo6': {
      'en': '',
      'ar': '',
    },
    'yu1j1ou9': {
      'en': 'Time Period',
      'ar': 'الفترة الزمنية',
    },
    '9vjco9j4': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'q5owctpa': {
      'en': 'This Week',
      'ar': 'هذا الأسبوع',
    },
    's0vf4n2t': {
      'en': 'This Month',
      'ar': 'هذا الشهر',
    },
    'oz6eobqh': {
      'en': 'This Year',
      'ar': 'هذه السنة',
    },
    '083arju5': {
      'en': 'Custom',
      'ar': 'مخصص',
    },
    'whjwkm1f': {
      'en': 'From',
      'ar': 'من',
    },
    'fawuh7px': {
      'en': ':',
      'ar': ':',
    },
    'wvvklydq': {
      'en': 'To',
      'ar': 'الى',
    },
    'pza7c63y': {
      'en': ':',
      'ar': ':',
    },
    '3oon81tv': {
      'en': 'Name:',
      'ar': 'الأسم:',
    },
    'v5ynndny': {
      'en': 'Job Title:',
      'ar': 'المسمي الوظيفى:',
    },
    'hlbxjjjl': {
      'en': 'Department:',
      'ar': 'القسم:',
    },
    'tdlaflqb': {
      'en': 'Shift Type:',
      'ar': 'الوردية:',
    },
    'lcn7i9gy': {
      'en': 'Date:',
      'ar': 'التاريخ:',
    },
    'lob1b06u': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // dashboard
  {
    'c6j8k1qv': {
      'en': 'Dashboard',
      'ar': 'الرسم البياني',
    },
    '81ahiuvk': {
      'en': 'Leaves',
      'ar': 'الأجازات',
    },
    '38utoqex': {
      'en': 'Hour\'s ',
      'ar': 'الساعات',
    },
    'qd3tz5dz': {
      'en': 'Working Hour\'s',
      'ar': 'ساعات العمل ',
    },
    'rya3p4oh': {
      'en': 'Please select date For Working Hours',
      'ar': 'الرجاء تحديد تاريخ ساعات العمل',
    },
    '7mhi0lvt': {
      'en': 'The days',
      'ar': 'الأيام',
    },
    'fdn8edrz': {
      'en': 'The Hours',
      'ar': ' الساعات',
    },
    'selaf8j3': {
      'en': 'Average Hours',
      'ar': 'متوسط الساعات',
    },
    'ri84aqq6': {
      'en': 'Work Hours Details',
      'ar': 'تفاصيل ساعات العمل',
    },
    'ctsk3jn0': {
      'en': 'No working hours in this week',
      'ar': 'لا يوجد ساعات عمل في هذا الأسبوع',
    },
    '4u366z4a': {
      'en': 'No Leave Balance Allocated',
      'ar': 'لم يتم تخصيص رصيد إجازات',
    },
    'j9k3igz0': {
      'en': 'Leaves State',
      'ar': 'حالة الأجازات',
    },
    '49vqdsnt': {
      'en': 'More Details',
      'ar': 'المزيد من التفاصيل',
    },
    'vixhujtn': {
      'en': 'Hide Details',
      'ar': 'إخفاء التفاصيل',
    },
    '3phcs4yo': {
      'en': 'Type',
      'ar': 'النوع',
    },
    'bed5jvey': {
      'en': 'Allocation',
      'ar': 'المخصص',
    },
    '52kw56w0': {
      'en': 'Acquired',
      'ar': 'المستهلك',
    },
    '3ir1w9my': {
      'en': 'Balance',
      'ar': 'الرصيد',
    },
    'cdhg1si7': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // debug
  {
    'xxdz0tvj': {
      'en': 'Error Page',
      'ar': 'صفحة الأخطاء',
    },
    'xk0l7yg0': {
      'en': 'Status Code:',
      'ar': 'رمز الحالة:',
    },
    '10i58ctk': {
      'en': 'Message:',
      'ar': 'الرسالة:',
    },
    'pjj3n34q': {
      'en': 'Error:',
      'ar': 'الخطأ:',
    },
    '0hiqnyoe': {
      'en': 'Description:',
      'ar': 'الوصف:',
    },
    'h77xwcfl': {
      'en': 'Type:',
      'ar': 'النوع:',
    },
    'ev0sleek': {
      'en': 'Share',
      'ar': 'مشاركة',
    },
    'do7gp6gy': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // Complaint
  {
    'wtl9o66c': {
      'en': 'Complaints',
      'ar': 'الشكاوى',
    },
    '2zxr1uxc': {
      'en': '',
      'ar': '',
    },
    '3h7ajzib': {
      'en': 'Status',
      'ar': 'الحالة',
    },
    'm5bh3s2p': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'k3pqyl0l': {
      'en': '',
      'ar': '',
    },
    'lvw5zm24': {
      'en': 'Time Period',
      'ar': 'الفترة الزمنية',
    },
    's0r6b1rb': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '1v6wr8g3': {
      'en': 'This Week',
      'ar': 'هذا الأسبوع',
    },
    'i31dsc14': {
      'en': 'This Month',
      'ar': 'هذا الشهر',
    },
    'wzdud781': {
      'en': 'This Year',
      'ar': 'هذه السنة',
    },
    '7fnkf1cq': {
      'en': 'Custom',
      'ar': 'مخصص',
    },
    'xfay38ue': {
      'en': 'From',
      'ar': 'من',
    },
    'dpoelpay': {
      'en': ':',
      'ar': ':',
    },
    'v23e2j3d': {
      'en': 'To',
      'ar': 'الى',
    },
    'fv79xbz9': {
      'en': ':',
      'ar': ':',
    },
    '0t0m1dho': {
      'en': 'Name:',
      'ar': 'الأسم:',
    },
    'zyc1wq7o': {
      'en': 'Job Title:',
      'ar': 'المسمي الوظيفى:',
    },
    'cin6e06f': {
      'en': 'Department:',
      'ar': 'القسم:',
    },
    '58h4ity1': {
      'en': 'Grievance Number:',
      'ar': 'رقم الشكوي:',
    },
    'wj1shky3': {
      'en': 'Date:',
      'ar': 'التاريخ :',
    },
    'wc2u23vy': {
      'en': 'Against Party:',
      'ar': 'المختص بالشكوي:',
    },
    '5syetudn': {
      'en': 'Grievance Against:',
      'ar': 'الشكوي في:',
    },
    'lt4rkvyw': {
      'en': 'Grievance Type:',
      'ar': 'نوع الشكوي:',
    },
    't3p7lqgi': {
      'en': 'Subject:',
      'ar': 'التوضيح:',
    },
    'e7bdj5nu': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // CardMisc
  {
    '5t4gnkbs': {
      'en': 'Misc',
      'ar': 'طلبات إدارية',
    },
    'q7c05412': {
      'en': 'Requests :  ',
      'ar': 'الطلبات :  ',
    },
  },
  // CardFinclaimsCard
  {
    'wiyc8j37': {
      'en': 'Financial Claims',
      'ar': 'تسوية مصروف',
    },
    'u0vpyag0': {
      'en': 'Claims :  ',
      'ar': 'الطلبات :  ',
    },
  },
  // CardLeaves
  {
    'fd1efr74': {
      'en': 'Leaves',
      'ar': 'الأجازات',
    },
    '80shgixd': {
      'en': 'Requests :  ',
      'ar': 'الطلبات :  ',
    },
  },
  // CardOvertime
  {
    'mcihc554': {
      'en': 'OverTime',
      'ar': 'الإضافي',
    },
    'bhk5j2xb': {
      'en': 'Requests :  ',
      'ar': 'الطلبات :  ',
    },
  },
  // CardLoans
  {
    'mnsjwr73': {
      'en': 'Loans',
      'ar': 'القروض',
    },
    '2sp7xuwf': {
      'en': 'Laons :  ',
      'ar': 'القروض :  ',
    },
  },
  // CardVacations
  {
    'ajot09ul': {
      'en': 'Annual',
      'ar': 'سنوي',
    },
    'obitn04v': {
      'en': 'Requests :',
      'ar': 'الطلبات :',
    },
  },
  // CardTraining
  {
    'wz4w3rqo': {
      'en': 'Training',
      'ar': 'تدريب',
    },
    '852oua4n': {
      'en': 'Requests :  ',
      'ar': 'الطلبات :  ',
    },
  },
  // SmallCardAnnual
  {
    'q0b6sle4': {
      'en': 'Annual',
      'ar': 'سنوي',
    },
  },
  // SmallCardFincliam
  {
    'emaxlcun': {
      'en': 'Finance',
      'ar': 'تسوية مصروف',
    },
  },
  // SmallCardLeave
  {
    'alaku4b9': {
      'en': 'Leaves',
      'ar': 'الأجازات',
    },
  },
  // SmallCardLoans
  {
    'd06j090o': {
      'en': 'Loans',
      'ar': 'السلف',
    },
  },
  // SmallCardmisc
  {
    '035wxjdo': {
      'en': 'Misc',
      'ar': 'طلبات إدارية',
    },
  },
  // SmallCardovertime
  {
    '2zzjv3jh': {
      'en': 'Overtime',
      'ar': 'الإضافي',
    },
  },
  // SmallAttandancerequestCard
  {
    'hh0oozcm': {
      'en': 'Attandance',
      'ar': 'الحضور',
    },
  },
  // ProfileCardContactinfromation
  {
    'kzewb54l': {
      'en': ' Contact\n information',
      'ar': 'المعلومات الشخصية',
    },
  },
  // ProfileCardAddress
  {
    '9p50e752': {
      'en': 'Address',
      'ar': 'العنوان',
    },
  },
  // ProfileCardBankinformation
  {
    'q56mz5zw': {
      'en': 'Bank\ninformation',
      'ar': 'معلومات  بنك',
    },
    '6vb67a05': {
      'en': 'This page have it is confidential information',
      'ar': 'هذه الصفحة تحتوي على معلومات شخصية',
    },
  },
  // ProfileCardAttachments
  {
    'i7ejzc2i': {
      'en': 'Attachments',
      'ar': 'المرفقات',
    },
  },
  // ProfileFinancialSalary
  {
    '74z7c22j': {
      'en': 'Details Salary',
      'ar': 'تفاصيل الراتب',
    },
    'cm8a7t6a': {
      'en': 'Date :',
      'ar': 'تاريخ :',
    },
    '7y8kkefq': {
      'en': 'Currency :',
      'ar': 'عملة :',
    },
    'kjft8nuv': {
      'en': 'Payroll Frequency :',
      'ar': 'الراتب الشهري :',
    },
    'cjubxvyg': {
      'en': 'Working Days :',
      'ar': 'أيام العمل :',
    },
  },
  // TimeAttendanceMissing
  {
    'lsgczgx1': {
      'en': 'Missing\nAttendance',
      'ar': 'الحضور مفقود',
    },
  },
  // TimeAttendanceHistory
  {
    'pfzj0ov1': {
      'en': 'Attendance\nHistory',
      'ar': 'تاريخ الحضور',
    },
  },
  // LeaveRequest
  {
    'dln5f3ua': {
      'en': 'Leave Request',
      'ar': 'طلب اجازة',
    },
    'xc5i1htr': {
      'en': 'Name :',
      'ar': 'الاسم:',
    },
    'ygl5ymbb': {
      'en': 'Id :',
      'ar': 'الرقم التعريفى:',
    },
    'sar500x8': {
      'en': 'From Date ',
      'ar': 'من تاريخ:',
    },
    '67hjx2v8': {
      'en': ':',
      'ar': '',
    },
    'bsj0dska': {
      'en': 'To Date ',
      'ar': 'الي تاريخ:',
    },
    '7yri2d6p': {
      'en': ':',
      'ar': '',
    },
    'scn7dc3a': {
      'en': '    Leaves Type',
      'ar': 'طلب اجازة',
    },
    'pfprzb1z': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'ksi81lpi': {
      'en': '    Reason',
      'ar': 'السبب',
    },
    'nn21sn2z': {
      'en': 'Leave Requests:',
      'ar': 'طلب اجازة:',
    },
    'lk65pe6g': {
      'en': 'Balance:',
      'ar': 'الرصيد:',
    },
    '0baanf65': {
      'en': 'Continue',
      'ar': 'الأستمرار',
    },
    '7swa1h42': {
      'en': 'Attachment ',
      'ar': 'ارفاق ملف ',
    },
  },
  // Financeclaim
  {
    'io80o0ev': {
      'en': 'Financial Request',
      'ar': 'تسوية المصروف',
    },
    'guohfenl': {
      'en': 'Name :',
      'ar': 'الأسم :',
    },
    '2cs6jorl': {
      'en': 'Id :',
      'ar': 'الرقم التعريفى :',
    },
    'ja9hhl96': {
      'en': 'Expense  Date ',
      'ar': 'تاريخ المصروف ',
    },
    'xboemo0h': {
      'en': ':',
      'ar': '',
    },
    'akfrjbaa': {
      'en': '     Claim Type',
      'ar': 'نوع المصروف',
    },
    '8d4k2l0x': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'mkryhn3g': {
      'en': ' Total Amount',
      'ar': 'المبلغ الكلى',
    },
    '9ycmos9o': {
      'en': ' Add  ',
      'ar': 'أضافة',
    },
    'qom8m1le': {
      'en': 'Continue',
      'ar': 'الأستمرار',
    },
  },
  // OverTime
  {
    'ffmrw6uv': {
      'en': 'OverTime Request',
      'ar': 'طلب العمل الإضافي',
    },
    '4sl9e440': {
      'en': 'Name :',
      'ar': 'الأسم :',
    },
    'mx9mdvh9': {
      'en': 'Id:',
      'ar': 'الرقم  تعريفى:',
    },
    'jfexkk8w': {
      'en': 'Attendance Date',
      'ar': 'تاريخ الحضور',
    },
    'bbkwijig': {
      'en': ':',
      'ar': ':',
    },
    '08svdeop': {
      'en': 'OverTime  Type',
      'ar': 'نوع العمل الإضافي',
    },
    'z5z2pjtt': {
      'en': 'Search for an item...',
      'ar': 'ابحث عن عنصر...',
    },
    'f8v94hwr': {
      'en': '   The number of hours',
      'ar': 'عدد الساعات',
    },
    'tneue9op': {
      'en': '   Reason',
      'ar': '  السبب',
    },
    'gmffr360': {
      'en': 'Continue',
      'ar': 'الأستمرار',
    },
  },
  // TrainingRequest
  {
    'v6fg3503': {
      'en': 'Training Request',
      'ar': 'طلب التدريب',
    },
    'vd49jc2n': {
      'en': 'Name :',
      'ar': 'الأسم:',
    },
    '1lltbmni': {
      'en': 'Id :',
      'ar': 'الرقم  تعريفى:',
    },
    'z18tn15t': {
      'en': 'Available Date ',
      'ar': 'التاريخ المتاح:',
    },
    '5u28mmir': {
      'en': ':',
      'ar': ':',
    },
    'mhggvzcr': {
      'en': ' Program Type',
      'ar': 'البرنامج التدربيبي',
    },
    'r620bwqa': {
      'en': 'Search for an item...',
      'ar': 'ابحث عن عنصر...',
    },
    'oi1hv7ho': {
      'en': 'Continue',
      'ar': 'الأستمرار',
    },
  },
  // MiscRequest
  {
    '9r2euof7': {
      'en': 'Miscellaneous  Request',
      'ar': 'طلبات إدارية',
    },
    'idv2v59y': {
      'en': 'Name :',
      'ar': 'اسم:',
    },
    'qd5p3u72': {
      'en': 'Id :',
      'ar': 'الرقم  تعريفى:',
    },
    'x2utozqj': {
      'en': ' Start Date ',
      'ar': 'تاريخ البدء',
    },
    'afn6hcwb': {
      'en': ':',
      'ar': ':',
    },
    '6yz56gph': {
      'en': 'Type',
      'ar': 'النوع',
    },
    'ro3hyk1n': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'bc3ifkbd': {
      'en': 'explanation',
      'ar': 'التوضيح',
    },
    'b1kul2n9': {
      'en': 'Continue',
      'ar': 'الأستمرار',
    },
    'm3650z14': {
      'en': 'Attachment ',
      'ar': 'ارفاق ملف ',
    },
  },
  // RequestAnnual
  {
    'vopzj04j': {
      'en': 'Annual Request',
      'ar': 'الطلب السنوي',
    },
    'jtpiq1cl': {
      'en': 'Name :',
      'ar': 'الأسم:',
    },
    'wamqg1pe': {
      'en': 'Id :',
      'ar': 'الرقم  تعريفى:',
    },
    '8wgnxwav': {
      'en': 'From Date :',
      'ar': 'من تاريخ:',
    },
    'qw77k6pa': {
      'en': '',
      'ar': '',
    },
    'yo59u2mr': {
      'en': 'To Date :',
      'ar': 'الي تاريخ:',
    },
    'mljjbof1': {
      'en': '',
      'ar': '',
    },
    'jna2b72s': {
      'en': 'Reason',
      'ar': 'السبب',
    },
    '3d0f9c0t': {
      'en': 'Annual Request :',
      'ar': 'أجازة سنوية',
    },
    '7bjwnk4h': {
      'en': 'Balance :',
      'ar': 'الرصيد:',
    },
    '9i1fwa03': {
      'en': 'Continue',
      'ar': 'الأستمرار',
    },
  },
  // LeonsRequest
  {
    'uol00sms': {
      'en': 'Loans  Request',
      'ar': 'طلب سلفة',
    },
    'pt08peey': {
      'en': 'Name :',
      'ar': 'الأسم:',
    },
    'yiz1k3xb': {
      'en': 'Id :',
      'ar': 'الرقم  تعريفى:',
    },
    'ynlniusw': {
      'en': ' Start Date ',
      'ar': 'تاريخ البدء',
    },
    'q040jgzc': {
      'en': ':',
      'ar': ':',
    },
    'rrgam6m2': {
      'en': 'Laons Type',
      'ar': 'نوع سلفة',
    },
    'x7jupoac': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'pyr217i8': {
      'en': 'Repayment ',
      'ar': 'السداد',
    },
    'sluh655v': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'e5oxfbkf': {
      'en': 'Repay Fixed Amount per Period',
      'ar': 'سداد مبلغ ثابت لكل فترة',
    },
    'r5ucpzn3': {
      'en': 'Repay Over Number of Periods',
      'ar': 'السداد على عدد من الفترات',
    },
    'u4hcs6pe': {
      'en': 'Loan Amount',
      'ar': 'مبلغ سلفة',
    },
    'nbceqjw5': {
      'en': 'Reason',
      'ar': '  السبب',
    },
    'ruel0p1f': {
      'en': 'Continue',
      'ar': 'الأستمرار',
    },
  },
  // Earnings
  {
    '5e6fdl8k': {
      'en': 'Earnings',
      'ar': 'المستحقات',
    },
    'buq38330': {
      'en': ':',
      'ar': ':',
    },
  },
  // DeductionsSalary
  {
    'ej5hfj2k': {
      'en': 'Deduction  Salary',
      'ar': 'الخصومات',
    },
    'ieg07a6j': {
      'en': ':',
      'ar': ':',
    },
  },
  // totalSalary
  {
    '4b9tm1cp': {
      'en': 'Total',
      'ar': 'الإجمالي',
    },
    'pbutbvrp': {
      'en': 'Gross Pay:',
      'ar': 'إجمالي الأجر:',
    },
    '9h7mhf1t': {
      'en': 'Total Deduction:',
      'ar': 'إجمالي الخصم:',
    },
    'aale4qb1': {
      'en': 'Total Loan Repayment:',
      'ar': 'إجمالي سداد القرض:',
    },
    '1jisuj6d': {
      'en': 'Year To Date:',
      'ar': 'من بداية السنة:',
    },
    '8m56izj8': {
      'en': 'Net Pay (SAR):',
      'ar': 'صافي الأجر:',
    },
  },
  // CreditCard
  {
    'zbxuf5f1': {
      'en': 'Bank:',
      'ar': 'بنك:',
    },
    'tbsiclem': {
      'en': 'Balance',
      'ar': 'الرصيد',
    },
    'i5dovvzk': {
      'en': 'Account Number:',
      'ar': 'رقم الحساب :',
    },
    '7jvjtjjl': {
      'en': 'IPAN:',
      'ar': 'رقم الحساب الدولي :',
    },
  },
  // referralEmployeesList
  {
    'zsmzn3nh': {
      'en': 'Referral an Employee',
      'ar': 'ترشيح موظف',
    },
    'qdbf2p9l': {
      'en': 'Frist Name:',
      'ar': 'الأسم الأول:',
    },
    '35a0q0ev': {
      'en': '',
      'ar': 'Ali',
    },
    'b5kda7wv': {
      'en': 'Use only letters',
      'ar': 'استخدم الحروف فقط',
    },
    'tm0fcmei': {
      'en': 'Last Name:',
      'ar': 'الأسم الأخير:',
    },
    'g8ojnqsi': {
      'en': '',
      'ar': '',
    },
    '2wrzmvf7': {
      'en': 'Use only letters',
      'ar': 'استخدم الحروف فقط',
    },
    'dtll1ojo': {
      'en': 'Email:',
      'ar': 'البريد الإلكتروني:',
    },
    'gfa368nv': {
      'en': '',
      'ar': '',
    },
    'nt4ks00h': {
      'en': 'Example123@gmail.com',
      'ar': 'Example123@gmail.com',
    },
    'oumg22cx': {
      'en': 'Send',
      'ar': 'أرسال',
    },
    'n5e6dk39': {
      'en': 'Upload',
      'ar': ' رفع ملف',
    },
  },
  // referralDataList
  {
    'y1h9zsn8': {
      'en': 'Job Title: ',
      'ar': 'المسمي الوظيفى:',
    },
    '3f2bv9fh': {
      'en': 'Num Of Position: ',
      'ar': 'عدد الوظائف :',
    },
    'ea7czefb': {
      'en': 'Status: ',
      'ar': 'الحالة:',
    },
    'rdilujge': {
      'en': 'Department: ',
      'ar': 'القسم:',
    },
    'o4ft4wb1': {
      'en': 'currency: ',
      'ar': 'العملة:',
    },
    'nivmyll4': {
      'en': 'Salary: ',
      'ar': 'الراتب:',
    },
    'p3ji8dyn': {
      'en': 'To',
      'ar': ' إلي ',
    },
    '3p12uy7w': {
      'en': 'Description: ',
      'ar': 'الوصف',
    },
    '49bbqgg2': {
      'en': 'Referral ',
      'ar': 'ترشيح',
    },
  },
  // AttachmentList
  {
    'nay6qjyv': {
      'en': 'Attachmentes ',
      'ar': 'المرفقات',
    },
    'lb6y9va0': {
      'en': 'Missing of',
      'ar': 'المفقود من',
    },
    'xly223tj': {
      'en': ' Issued  to HR',
      'ar': 'أرسلت  للموارد البشرية',
    },
    '7a7tjvvk': {
      'en': 'Show',
      'ar': 'يعرض',
    },
    'fie3t1t7': {
      'en': 'Messing ',
      'ar': 'المفقود',
    },
  },
  // AttendanceCard
  {
    'h2pis08n': {
      'en': 'Attandance',
      'ar': ' الحضور',
    },
    'rbtfjqb9': {
      'en': 'Requests :  ',
      'ar': 'الطلبات :  ',
    },
  },
  // ShiftCard
  {
    'bjyix3gt': {
      'en': 'Shift',
      'ar': 'وردية',
    },
    'o2xg2sqz': {
      'en': 'Requests :  ',
      'ar': 'الطلبات :  ',
    },
  },
  // ShiftRequestCard
  {
    '0vsz52xi': {
      'en': 'Shift ',
      'ar': 'وردية',
    },
  },
  // TrainingCard
  {
    'fwtvy71u': {
      'en': 'Training ',
      'ar': 'التدريب',
    },
  },
  // AttandanceReq
  {
    '3vrqg1rm': {
      'en': 'Attandance Request',
      'ar': 'طلب الحضور',
    },
    'rthwg6z5': {
      'en': 'Half Day ',
      'ar': 'نصف يوم',
    },
    '1tzuk45k': {
      'en': 'Name :',
      'ar': 'الأسم:',
    },
    'ht9rembk': {
      'en': 'Id :',
      'ar': 'الرقم التعريفى:',
    },
    'y5ixu9fp': {
      'en': 'From Date ',
      'ar': 'من تاريخ:',
    },
    '5i3ihv9s': {
      'en': ':',
      'ar': ':',
    },
    'vzxyqrr2': {
      'en': 'To Date ',
      'ar': 'الي تاريخ:',
    },
    'd4e45z3k': {
      'en': ':',
      'ar': ':',
    },
    '4ircctxj': {
      'en': 'Date ',
      'ar': 'التاريخ:',
    },
    '3z9pacnb': {
      'en': ':',
      'ar': ':',
    },
    'j32gcwxj': {
      'en': 'Reason',
      'ar': '  السبب',
    },
    '39mwrvtn': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر....',
    },
    'xy9067js': {
      'en': '0',
      'ar': '',
    },
    'nd7qn1ih': {
      'en': '5',
      'ar': '',
    },
    'algin1g3': {
      'en': '10',
      'ar': '',
    },
    'ly1wpiai': {
      'en': '15',
      'ar': '',
    },
    'gz3jbt85': {
      'en': '20',
      'ar': '',
    },
    'b7p6sbey': {
      'en': '',
      'ar': '',
    },
    '07a93ufi': {
      'en': '  Explanation',
      'ar': 'التوضيح',
    },
    'cw01d2pc': {
      'en': 'Continue',
      'ar': 'الأستمرار',
    },
  },
  // ShiftReq
  {
    'lqgcaouc': {
      'en': 'Shift Request',
      'ar': 'طلب وردية',
    },
    'g1i05554': {
      'en': 'Name :',
      'ar': 'الأسم:',
    },
    'glv2o21z': {
      'en': 'Id :',
      'ar': 'الرقم التعريفى:',
    },
    '46rj8zjk': {
      'en': 'From Date ',
      'ar': 'من تاريخ:',
    },
    '47gegcu8': {
      'en': ':',
      'ar': ':',
    },
    '9zypu1zo': {
      'en': 'To Date ',
      'ar': 'الي تاريخ:',
    },
    '32e7o6a0': {
      'en': ':',
      'ar': ':',
    },
    '07doqpov': {
      'en': ' Shift Type',
      'ar': 'الوردية',
    },
    '1a99wazt': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر....',
    },
    'u9nd35uj': {
      'en': 'Continue',
      'ar': 'الأستمرار',
    },
  },
  // ErrorsPrint
  {
    'btqbw8gm': {
      'en': 'Feiled',
      'ar': 'خطأ',
    },
    'bnqzdlkm': {
      'en': 'Close',
      'ar': 'أغلاق',
    },
  },
  // successfulMessage
  {
    'idewz4vy': {
      'en': 'Successful',
      'ar': 'عملية ناجحة',
    },
    'xatt1x72': {
      'en': 'Close',
      'ar': 'اغلاق',
    },
  },
  // NextActionsForOthers
  {
    'yt3xu7xa': {
      'en': 'Next Actions',
      'ar': 'الإجراءات التالية',
    },
    'b8cqxk3b': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'kpcr7glo': {
      'en': 'Send',
      'ar': 'أرسال',
    },
    'cq47fuoo': {
      'en': 'Close',
      'ar': 'أغلاق',
    },
  },
  // OthersRequest
  {
    'ble5n7vv': {
      'en': 'Type',
      'ar': 'النوع',
    },
    '5290kyet': {
      'en': ':',
      'ar': ':',
    },
    'a25cef6y': {
      'en': 'Date',
      'ar': 'التاريخ',
    },
    'v5qb4494': {
      'en': ':',
      'ar': ':',
    },
    'vexlsevg': {
      'en': 'Url',
      'ar': 'الرابط',
    },
    'psndbrr9': {
      'en': ':',
      'ar': ':',
    },
    '2xmymk4q': {
      'en': ' Go To web site',
      'ar': 'زيارة الموقع',
    },
    'sb1kghv8': {
      'en': 'Request Id',
      'ar': 'رقم الطلب',
    },
    'yyqv51w3': {
      'en': ':',
      'ar': ':',
    },
    'qzqzkgmv': {
      'en': 'Next Actions',
      'ar': 'الإجراءات التالية',
    },
    'nwjg7bfv': {
      'en': 'View bdf',
      'ar': 'عرض الملف',
    },
  },
  // nextActionsForHr
  {
    'j5kzvvnl': {
      'en': 'Next Actions',
      'ar': 'الإجراءات التالية',
    },
    '1aodgx0f': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '1dlh3v15': {
      'en': 'Send',
      'ar': 'أرسال',
    },
    's9x7wo5i': {
      'en': 'Close',
      'ar': 'أغلاق',
    },
  },
  // hrRequests
  {
    'wwis9yx8': {
      'en': 'Name',
      'ar': 'الأسم',
    },
    'fk8fel8k': {
      'en': ':',
      'ar': ':',
    },
    'xzqo570k': {
      'en': 'Next Action',
      'ar': 'الإجراءات التالية',
    },
  },
  // developerMoodError
  {
    'ikennomd': {
      'en': 'Warning ',
      'ar': 'عملية فاشلة',
    },
    's8gg3fqe': {
      'en': 'Please Close Developer Mode',
      'ar': 'الرجاء إغلاق وضع المطور',
    },
    '4c1e15ss': {
      'en': 'Ok',
      'ar': 'موافق',
    },
  },
  // successfulMessageforTransactions
  {
    'd5fyjz66': {
      'en': 'Successful',
      'ar': 'ناجح',
    },
    'z5jz8iqr': {
      'en': 'continue',
      'ar': 'أستمرار',
    },
  },
  // privacyPolicy
  {
    's8dw0gl1': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
    },
    'wzwq5zea': {
      'en':
          'Last Updated: 9/2/2024\nWelcome to the Talentio Employee Self-Service HRM App. By using our App, you agree to the collection and use of information as described in this Privacy Policy.',
      'ar':
          'آخر تحديث: 9/2/2024\nمرحبًا بك في تطبيق إدارة الموارد البشرية للخدمة الذاتية لموظفي Talentio. باستخدام تطبيقنا، فإنك توافق على جمع واستخدام المعلومات كما هو موضح في سياسة الخصوصية هذه.',
    },
    '69vodak0': {
      'en': 'Information We Collect',
      'ar': 'المعلومات التي نجمعها',
    },
    'lcii0lv5': {
      'en':
          'We collect personal information (e.g., your name, email, employee ID) and employment-related information (e.g., job title, department).',
      'ar':
          'نقوم بجمع المعلومات الشخصية (مثل اسمك والبريد الإلكتروني ومعرف الموظف) والمعلومات المتعلقة بالتوظيف (مثل المسمى الوظيفي والقسم).',
    },
    'ehm273aw': {
      'en': 'How We Use Your Information',
      'ar': 'كيف نستخدم معلوماتك',
    },
    'xbqzp2a8': {
      'en': 'Your data is used to:',
      'ar': 'يتم استخدام بياناتك من أجل:',
    },
    '23m5t7ha': {
      'en': '• Provide and improve our Services.',
      'ar': '• تقديم خدماتنا وتحسينها.',
    },
    'xd5drujc': {
      'en': '• Manage HR functions like leave requests, payroll, and benefits.',
      'ar':
          '• إدارة وظائف الموارد البشرية مثل طلبات الإجازة، والرواتب، والفوائد.',
    },
    'o7nvwj4k': {
      'en': '• Facilitate communication within the organization.',
      'ar': '• تسهيل الاتصال داخل المنظمة.',
    },
    'jynnmy0v': {
      'en': 'Information Sharing',
      'ar': 'تبادل المعلومات',
    },
    'bdnhg40s': {
      'en':
          'We do not share your personal information except with trusted partners and to comply with legal obligations',
      'ar':
          'نحن لا نشارك معلوماتك الشخصية إلا مع شركاء موثوقين وامتثالاً للالتزامات القانونية',
    },
    'wrswucny': {
      'en': 'Security',
      'ar': 'حماية',
    },
    'j5o68dja': {
      'en':
          'We implement industry-standard security measures to protect your data.',
      'ar': 'نحن ننفذ إجراءات أمنية متوافقة مع معايير الصناعة لحماية بياناتك.',
    },
    '2q7mly0n': {
      'en': 'Your Rights',
      'ar': 'حقوقك',
    },
    'cbpv7dyq': {
      'en':
          'You can access, correct, and request deletion of your personal data.',
      'ar': 'يمكنك الوصول إلى بياناتك الشخصية وتصحيحها وطلب حذفها.',
    },
    '2nq6mh9x': {
      'en': 'Contact Us',
      'ar': 'للأتصال بنا',
    },
    'ghrgsx57': {
      'en': 'For any questions, please contact us at:  ',
      'ar': 'لأية أسئلة، يرجى الاتصال بنا على:',
    },
    'o81vei8b': {
      'en': 'support@golive-solutions.com',
      'ar': 'support@golive-solutions.com',
    },
    'nk632n3w': {
      'en':
          'By clicking \"Agree\" you acknowledge that you have read and understood our Privacy Policy.',
      'ar':
          'بالنقر على \"موافقة\"، فإنك تقر بأنك قد قرأت وفهمت سياسة الخصوصية الخاصة بنا.',
    },
    'f5o1zrdj': {
      'en': 'Decline',
      'ar': 'رفض',
    },
    '3fv9hjy9': {
      'en': ' Agree',
      'ar': 'موافقة',
    },
  },
  // CardComplaints
  {
    '6vcw00zy': {
      'en': 'Complaints',
      'ar': 'الشكاوى',
    },
    'hioxx1vq': {
      'en': 'Complaints :  ',
      'ar': 'الشكوى :  ',
    },
  },
  // Complaints
  {
    'd21scppc': {
      'en': 'Complaints Request',
      'ar': 'طلب شكوي',
    },
    '8erebuiz': {
      'en': 'Name:',
      'ar': 'الأسم:',
    },
    'hupn2oqe': {
      'en': 'Id:',
      'ar': 'كود الموظف : ',
    },
    'g9xr4sef': {
      'en': 'Date ',
      'ar': 'التاريخ:',
    },
    'gk6d8oe8': {
      'en': ':',
      'ar': '',
    },
    'wt4e23fo': {
      'en': 'Complaint Party',
      'ar': 'المختص بالشكوى:',
    },
    'e9p8liw2': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    '3b6jfifa': {
      'en': 'Complaint Against',
      'ar': 'الشكوى في :',
    },
    '2z0yiocg': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    '8e2usbm0': {
      'en': 'Complaint Type',
      'ar': 'نوع الشكوى :',
    },
    'x0b2kjgm': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'l677a9fj': {
      'en': '   Subject',
      'ar': 'الموضوع',
    },
    '6hb9hb0l': {
      'en': '   Description',
      'ar': 'الوصف',
    },
    'eu7hedjl': {
      'en': 'Complaints :',
      'ar': ' الشكاوى :',
    },
    'w40pttme': {
      'en': 'Continue',
      'ar': 'الأستمرار',
    },
  },
  // SmallCardComplaints
  {
    'f18c6u6h': {
      'en': 'Complaints',
      'ar': 'الشكاوى',
    },
  },
  // CompanyPrivacyPolicy
  {
    'wzcmcjtr': {
      'en': 'Company Privacy Policy',
      'ar': 'سياسة خصوصية الشركة',
    },
    '35bp8a70': {
      'en': 'I\'m',
      'ar': 'أنا',
    },
    'gquept6b': {
      'en': 'pledge that',
      'ar': 'أتعهد بذلك',
    },
    'b1onwt4e': {
      'en': 'أتعهد أنا  الموظف',
      'ar': 'أتعهد أنا  الموظف',
    },
    '8x3q3gbb': {
      'en': 'Decline',
      'ar': 'رفض',
    },
    'mhukoxk1': {
      'en': ' Agree',
      'ar': 'موافقة',
    },
  },
  // hentToSalary
  {
    'wm1aks07': {
      'en': 'Note',
      'ar': 'ملحوظة',
    },
    '7oogbhkh': {
      'en': 'Please select the year and then the month',
      'ar': 'الرجاء تحديد السنة ثم الشهر',
    },
    '9m7w9zqb': {
      'en': 'Don\'t Show again',
      'ar': 'لا تظهر مرة أخرى',
    },
  },
  // attendanceBottomSheet
  {
    'wrjkmqtp': {
      'en': 'Track check-in and check-out for accurate time monitoring.',
      'ar': 'تسجيل الدخول والخروج لضمان تتبع  الوقت بدقة.',
    },
    'fpecby4t': {
      'en': 'Check in',
      'ar': 'الدخول',
    },
    '5xbwpnxa': {
      'en': 'Check out ',
      'ar': 'الخروج',
    },
  },
  // urlError
  {
    'lz6v656i': {
      'en': 'error',
      'ar': 'خطأ',
    },
    'xy81w869': {
      'en': 'Please enter the URL and try again',
      'ar': 'الرجاء إدخال عنوان URL والمحاولة مرة أخرى',
    },
    'c59y2tc6': {
      'en': 'Ok',
      'ar': 'موافق',
    },
  },
  // ErrorFcm
  {
    '3w6y9bn0': {
      'en': 'Authentication error',
      'ar': 'خطأ في المصادقة',
    },
    'zquzu08y': {
      'en': 'Please Check Fcm Token And Try Again',
      'ar': 'يرجى التحقق من رمز Fcm والمحاولة مرة أخرى',
    },
    'jfx9by5e': {
      'en': 'Ok',
      'ar': 'موافق',
    },
  },
  // loginError
  {
    'fnfgn4a9': {
      'en': 'Authentication error',
      'ar': 'خطأ في المصادقة',
    },
    '6wb6k0ub': {
      'en':
          'Sorry, the link is invalid or has been removed, Please check the link and try again',
      'ar':
          'عذرًا، الرابط غير صالح أو قد تم إزالته, من فضلك تحقق من الرابط وحاول مرة اخري ',
    },
    'jjorqzf3': {
      'en': 'Ok',
      'ar': 'موافق',
    },
  },
  // Miscellaneous
  {
    'luorikah': {
      'en': 'Talentio requires permissions to perform finger verification',
      'ar': 'يتطلب Talentio أذونات لإجراء التحقق  بالإصبع',
    },
    'mv1gbycc': {
      'en':
          'We use your location to help you find nearby company facilities and events. This information helps you navigate to work-related locations more efficiently',
      'ar':
          'نحن نستخدم موقعك لمساعدتك في العثور على مرافق وفعاليات الشركة القريبة. تساعدك هذه المعلومات على التنقل إلى المواقع المرتبطة بالعمل بشكل أكثر كفاءة',
    },
    'jh6saoaf': {
      'en':
          'We need access to your camera to allow you to capture and upload photos for your employee profile picture and to scan necessary documents for HR purposes',
      'ar':
          'نحتاج إلى الوصول إلى الكاميرا الخاصة بك للسماح لك بالتقاط الصور وتحميلها لصورة ملف تعريف الموظف الخاص بك ومسح المستندات اللازمة لأغراض الموارد البشرية',
    },
    '8ex16jmi': {
      'en':
          'We need access to your photo library to allow you to upload images for your employee profile picture and to submit photos of documents required for HR processes.',
      'ar':
          'نحتاج إلى الوصول إلى مكتبة الصور الخاصة بك للسماح لك بتحميل الصور لصورة ملف تعريف الموظف الخاص بك وإرسال صور المستندات المطلوبة لعمليات الموارد البشرية.',
    },
    '4m9tieoh': {
      'en':
          'We need to be able to send you Notifications to be able get communicate in efficient way',
      'ar': 'نحن بحاجة إلى أن نكون قادرين على إرسال الإشعارات لك',
    },
    'tv2inurv': {
      'en': '',
      'ar': 'خطأ',
    },
    'pkbjv3f7': {
      'en': '',
      'ar': 'ارسال الايميل ',
    },
    'r8ifhjdv': {
      'en': '',
      'ar': '',
    },
    'rzxae1d0': {
      'en': '',
      'ar': '',
    },
    't4t94bfo': {
      'en': '',
      'ar': '',
    },
    '1o19eyui': {
      'en': '',
      'ar': '',
    },
    '8if7wd3l': {
      'en': '',
      'ar': '',
    },
    'ek2ll0lf': {
      'en': '',
      'ar': '',
    },
    'ncqjfaib': {
      'en': '',
      'ar': '',
    },
    'qs7dgpuf': {
      'en': '',
      'ar': 'هذا الايميل مستخدم من قبل',
    },
    '8ncra1v0': {
      'en': '',
      'ar': '',
    },
    'x0nvfacw': {
      'en': '',
      'ar': '',
    },
    'in4e2kad': {
      'en': '',
      'ar': '',
    },
    'gjd0zapv': {
      'en': '',
      'ar': '',
    },
    'ja3tj9ly': {
      'en': '',
      'ar': '',
    },
    'xrioijjx': {
      'en': '',
      'ar': '',
    },
    'vsc0c4k5': {
      'en': '',
      'ar': '',
    },
    'zte9zx4h': {
      'en': '',
      'ar': '',
    },
    'v0uppaug': {
      'en': '',
      'ar': '',
    },
    '1i0ygopf': {
      'en': '',
      'ar': '',
    },
    'n12epqug': {
      'en': '',
      'ar': '',
    },
    'hr3w8eti': {
      'en': '',
      'ar': '',
    },
    'p626indf': {
      'en': '',
      'ar': '',
    },
    '4qw84wpk': {
      'en': '',
      'ar': '',
    },
    'kuna3qk2': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
