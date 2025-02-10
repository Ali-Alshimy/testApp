import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/auth/custom_auth/auth_util.dart';

dynamic findJopbyJopId(
  List<dynamic> referralList,
  String find,
) {
  // Initialize the variable to hold the found referral data.
  dynamic referralDataStruct = null;

  // Print the referral list for debugging purposes.
  print(referralList);

  // Iterate over each referral (job) in the list.
  referralList.forEach((job) {
    // Debugging message to ensure the loop is executing.
    print("here");

    // If the 'job_title' of the current job matches the 'find' string, set the referral data.
    if (job['job_title'] == find) {
      referralDataStruct = job;
    }
  });

  // Return the found referral data or null if no match is found.
  return referralDataStruct;
}

String? salaryDate(String month) {
  Map<String, String> monthes = {
    "01": "January",
    "02": "February",
    "03": "March",
    "04": "April",
    "05": "May",
    "06": "June",
    "07": "July",
    "08": "August",
    "09": "September",
    "10": "October",
    "11": "November",
    "12": "December"
  };
  return monthes[month];
}

bool knowIfIsList(dynamic message) {
// Check if the "message" field in the given object is a List.
  if (message["message"] is List) {
    return true; // Return true if "message" is a List.
  }
  return false; // Return false if "message" is not a List.
}

List<String> nullable(List<dynamic> nextaction) {
  // Check if nextaction is null
  // ignore: unnecessary_null_comparison
  if (nextaction == null) {
    return [""]; // Return a list with a single string "null"
  } else {
    // Convert each JSON object to string representation
    List<String> stringList =
        nextaction.map((item) => jsonEncode(item)).toList();
    return stringList;
  }
}

List<String> removeQotion(List<String> input) {
  return input.map((str) => str.replaceAll('"', '')).toList();
}

List<String> makeListShiftType(List<dynamic> types) {
// Iterate over each item in the 'types' list, extract 'name', 'start_time', and 'end_time',
// format them into a string, and add it to the result list.
  List<String> result = [];
  String shift = "";
  types.forEach((type) => {
        shift =
            "${type["name"]} \nFrom ${type["start_time"]} To ${type["end_time"]}",
        result.add(shift)
      });
  return result;
}

Color? getColorFromStatus(String status) {
  if (status.contains('Pending') || status.contains('Waiting')) {
    return Color(0xFFFA710F); // #fa710f color
  } else if (status.contains('Approved') ||
      status.contains('released') ||
      status.contains('Released')) {
    return Color(0xFF249689); // #249689 color
  } else if (status.contains('Cancelled') || status.contains('Rejected')) {
    return Color(0xFFFF1F1F); // #ff1f1f color
  } else {
    return Colors.black; // Default color if no status matches
  }
}

double returnNonNegativeValue(double value) {
  return value < 0 ? 0.0 : value;
}

String getNowDateTime() {
  DateTime now = DateTime.now();
  // Get the current date and time.

  DateFormat dateFormatter = DateFormat('yyyy-MM-dd');
  // Define a date format (year-month-day).

  DateFormat timeFormatter = DateFormat('HH:mm:ss');
  // Define a time format (hours:minutes:seconds).

  String dateFormatted = dateFormatter.format(now);
  // Format the current date.

  String timeFormatted = timeFormatter.format(now);
  // Format the current time.

  return '$dateFormatted $timeFormatted';
  // Return the formatted date and time as a single string.
}

String? formatDateInEnglish(DateTime? date) {
  if (date != null) {
    DateFormat formatter = DateFormat('yyyy-MM-dd');

    // Format the DateTime object
    String formatted = formatter.format(date);

    // Return the formatted date string
    return formatted;
  }
  return null;
}

String formatDateYear(DateTime date) {
  DateFormat formatter =
      DateFormat('yyyy'); // Define the date format to show only the year.
  String formatted = formatter.format(
      date); // Format the provided 'date' object to display only the year.
  return formatted; // Return the formatted year as a string.
}

String formatDateInMonth(DateTime date) {
  DateFormat formatter = DateFormat('LLLL');

  // Format the DateTime object
  String formatted = formatter.format(date);

  // Return the formatted date string
  return formatted;
}

ErrorsStruct jsonToErrors(
  dynamic body,
  String statusCode,
) {
  // Check if the body is null or not a Map. If so, return an error structure with default values.
  if (body == null || body is! Map) {
    return ErrorsStruct(
      message: "Invalid input please try again", // Error message
      statusCode: statusCode, // Status code passed as argument
      error: "", // Empty error field
      type: "", // Empty type field
      descrption: "", // Empty description field
      details: "", // Empty details field
    );
  }

  // Create an ErrorsStruct object based on the body content.
  ErrorsStruct errorStruct = ErrorsStruct(
    message: body.containsKey('message') && body['message'] != null
        ? body['message']
            as String // If 'message' exists and is not null, use it.
        : "",
    statusCode: statusCode, // The status code is passed as an argument.
    error: body.containsKey('exception') && body['exception'] != null
        ? (body['exception'] as String).replaceAll(
            "frappe.exceptions.", "") // Clean up the exception string.
        : "",
    type: body.containsKey('exc_type') && body['exc_type'] != null
        ? body['exc_type'] as String // Extract exception type.
        : "",
    descrption: body.containsKey('descrption') && body['descrption'] != null
        ? body['descrption'] as String // Extract description (if available).
        : "",
    details: body.containsKey('exc') && body['exc'] != null
        ? body['exc'] as String // Extract details of the exception.
        : "",
  );

  return errorStruct; // Return the structured error object.
}

List<String> makeListComplaintsType(List<dynamic> types) {
// Iterate through the 'types' list, and for each 'type', create a formatted string
// that includes the "name" and "employee_name" properties, then add it to the result list.
  List<String> result = [];
  types.forEach((type) {
    String employee = "${type["name"]}\n"
        "${type["employee_name"]}\n\n";
    result.add(employee);
  });
  return result;
}

DateTime? convertStringToDate(String? dateString) {
  /// Converts a nullable string into a DateTime object.
  /// Returns null if the input is null, empty, or invalid.

  // Check if the string is null or empty. If so, return null.
  if (dateString == null || dateString.isEmpty) return null;

  try {
    // Attempt to parse the string into a DateTime object.
    DateTime parsedDate = DateTime.parse(dateString);
    return parsedDate;
  } catch (e) {
    // If parsing fails, return null.
    return null;
  }
}

String formatDateTime(String creation) {
  try {
    String cleanDateTime = creation.split('.')[0];
    DateTime dateTime = DateTime.parse(cleanDateTime);

    final DateFormat dateFormatter = DateFormat('y-MM-dd');
    final DateFormat timeFormatter = DateFormat('HH:mm');

    String formattedDate = 'date : ${dateFormatter.format(dateTime)}';
    String formattedTime = 'hour : ${timeFormatter.format(dateTime)}';

    return '$formattedDate\n\n$formattedTime';
  } catch (e) {
    return 'Invalid date format';
  }
}

String? formatName(String? fullName) {
  /// Returns the first and last name, or an empty string if invalid.

  if (fullName == null || fullName.trim().isEmpty) {
    return '';
  }

  List<String> names =
      fullName.trim().split(' ').where((name) => name.isNotEmpty).toList();

  if (names.isEmpty) {
    return '';
  }
  if (names.length == 1) {
    return names[0];
  }

  return '${names.first} ${names.last}';
}

int convertDoubleToInt(double number) {
  /// Converts a double to an integer by rounding it to the nearest whole number.
  /// Example: 3.6 -> 4, 3.2 -> 3.
  return number.round();
}

List<dynamic> filterZeroPercentageFromMessage(List<dynamic> jsonList) {
  // If the input list is empty, return an empty list.
  if (jsonList.isEmpty) {
    return [];
  }

  // Check if the first element is a Map containing a key "message".
  if (jsonList.first is Map && jsonList.first.containsKey('message')) {
    // Extract the "message" list from the first element.
    List<dynamic> messageList = jsonList.first['message'];

    // Filter the "message" list to exclude items with a percentage of 0 or null.
    return messageList.where((item) {
      if (item != null && item['percentage'] != null) {
        final percentage = item['percentage'];
        return percentage > 0; // Only include items with a positive percentage.
      }
      return false; // Exclude items with null or 0 percentage.
    }).toList();
  }

  // If the list doesn't have the "message" key, directly filter the input list.
  return jsonList.where((item) {
    if (item != null && item['percentage'] != null) {
      final percentage = item['percentage'];
      return percentage > 0; // Only include items with a positive percentage.
    }
    return false; // Exclude items with null or 0 percentage.
  }).toList();
}

String formatDateTimeAttendance(
  String dateTime,
  String? date,
  String? time,
  String action,
  bool isEnglish,
) {
  try {
    DateTime parsedDate = DateTime.parse(dateTime);

    String translatedDate =
        '${_convertToArabicNumbers(parsedDate.day, isEnglish)}-' +
            '${_convertToArabicNumbers(parsedDate.month, isEnglish)}';

    String hour = _convertToArabicNumbers(
        (parsedDate.hour % 12 == 0 ? '12' : (parsedDate.hour % 12).toString())
            .padLeft(2, '0'),
        isEnglish);

    String minute = _convertToArabicNumbers(
        parsedDate.minute.toString().padLeft(2, '0'), isEnglish);

    String period = isEnglish
        ? (parsedDate.hour >= 12 ? 'PM' : 'AM')
        : (parsedDate.hour >= 12 ? 'م' : 'ص');

    String translatedTime = '$hour:$minute $period';

    String dateLabel = isEnglish ? (date ?? 'Date') : (date ?? 'التاريخ');
    String timeLabel = isEnglish ? (time ?? 'Time') : (time ?? 'الوقت');

    return '$dateLabel : $translatedDate\n$timeLabel : $translatedTime';
  } catch (e) {
    return isEnglish ? "No $action Today" : "لا يوجد $action اليوم";
  }
}

String _convertToArabicNumbers(dynamic number, bool isEnglish) {
  if (isEnglish) return number.toString();

  final arabicNumbers = {
    '0': '٠',
    '1': '١',
    '2': '٢',
    '3': '٣',
    '4': '٤',
    '5': '٥',
    '6': '٦',
    '7': '٧',
    '8': '٨',
    '9': '٩',
  };

  return number
      .toString()
      .split('')
      .map((digit) => arabicNumbers[digit] ?? digit)
      .join('');
}

double getDynamicEquationResult(double number) {
  return number.abs() / 100;
// Return the absolute value of the number divided by 100.
}

int? getWeekNumber(String input) {
  final arabicToEnglishMap = {
    "الأسبوع الأول": 1,
    "الأسبوع الثاني": 2,
    "الأسبوع الثالث": 3,
    "الأسبوع الرابع": 4,
    "الأبوع الخامس": 5
  };
  // Map Arabic week names to their corresponding week numbers.

  final regex = RegExp(r'Week (\d+)');
  // Regular expression to match strings like 'Week 1', 'Week 2', etc.

  final match = regex.firstMatch(input);
  // Attempt to find a match for the pattern in the input string.

  if (match != null) {
    return int.tryParse(match.group(1)!);
    // If a match is found, return the week number as an integer.
  }

  if (arabicToEnglishMap.containsKey(input)) {
    return arabicToEnglishMap[input];
    // If the input is an Arabic week name, return the corresponding week number.
  }

  return null;
  // Return null if no valid match is found.
}

bool verifyAttendanceTime() {
  final now = DateTime.now();
  final hour = now.hour;
  return hour >= 6 && hour < 12;
}

String formatFieldCheckInAndOut(
  dynamic fieldJson,
  bool isEnglish,
) {
  /// Formats check-in and check-out field data based on the provided JSON.
  /// It handles different types of inputs and returns the data formatted in either English or Arabic.

  final arabicNumbers = {
    '0': '٠',
    '1': '١',
    '2': '٢',
    '3': '٣',
    '4': '٤',
    '5': '٥',
    '6': '٦',
    '7': '٧',
    '8': '٨',
    '9': '٩',
  };

  // If the input is null, return a message indicating no data is available.
  if (fieldJson == null) {
    return isEnglish ? "No Data" : "لا توجد بيانات";
  }

  String? value;

  // If fieldJson is a Map and contains a 'message' key, process its value.
  if (fieldJson is Map && fieldJson.containsKey('message')) {
    final messageList = fieldJson['message'];
    if (messageList is List && messageList.isNotEmpty) {
      final firstItem = messageList[0];
      final possibleFields = [
        'check_in_time',
        'checkInTime',
        'check_out_time',
        'checkOutTime',
        'check_in_date',
        'checkInDate',
        'check_out_date',
        'checkOutDate'
      ];

      // Check if the first item in the message contains any of the possible field keys.
      for (String key in possibleFields) {
        if (firstItem is Map &&
            firstItem.containsKey(key) &&
            firstItem[key] != null) {
          value = firstItem[key].toString();
          break;
        }
      }
    }
  } else if (fieldJson is Map) {
    // If fieldJson is a Map, check for possible field keys directly.
    final possibleFields = [
      'check_in_time',
      'checkInTime',
      'check_out_time',
      'checkOutTime',
      'check_in_date',
      'checkInDate',
      'check_out_date',
      'checkOutDate'
    ];

    for (String key in possibleFields) {
      if (fieldJson.containsKey(key) && fieldJson[key] != null) {
        value = fieldJson[key].toString();
        break;
      }
    }
  } else if (fieldJson is List && fieldJson.isNotEmpty) {
    // If fieldJson is a List, process the first item.
    final firstItem = fieldJson[0];
    if (firstItem is Map) {
      final possibleFields = [
        'check_in_time',
        'checkInTime',
        'check_out_time',
        'checkOutTime',
        'check_in_date',
        'checkInDate',
        'check_out_date',
        'checkOutDate'
      ];

      for (String key in possibleFields) {
        if (firstItem.containsKey(key) && firstItem[key] != null) {
          value = firstItem[key].toString();
          break;
        }
      }
    }
  } else if (fieldJson is String) {
    // If fieldJson is a String, use it directly as the value.
    value = fieldJson;
  }

  // If no value is found, return a message indicating no data.
  if (value == null || value.isEmpty) {
    return isEnglish ? "No Data" : "لا توجد بيانات";
  }

  // If the value contains a time format (e.g., 'HH:mm'), format it accordingly.
  if (value.contains(':')) {
    return formatTime(value, isEnglish, arabicNumbers);
  } else if (value.contains('-')) {
    // If the value contains a date (e.g., 'yyyy-MM-dd'), format it and translate to Arabic if needed.
    return isEnglish ? value : translateNumbersToArabic(value, arabicNumbers);
  } else {
    // If the value doesn't match expected formats, return an error message.
    return isEnglish ? "Invalid field format" : "تنسيق الحقل غير صالح";
  }
}

String formatTime(
    String time, bool isEnglish, Map<String, String> arabicNumbers) {
  /// Formats the time string (e.g., 'HH:mm') to 12-hour format with AM/PM or Arabic equivalents.
  /// If the input is invalid, returns an error message.

  try {
    final parts = time.split(':');
    if (parts.length < 2) {
      throw Exception("Invalid time format");
    }

    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);

    // Determine if the time is AM or PM.
    final isAM = hour < 12;
    final period =
        isAM ? (isEnglish ? "AM" : "صباحًا") : (isEnglish ? "PM" : "مساءً");

    // Convert to 12-hour format.
    final formattedHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);

    final formattedMinute = minute.toString().padLeft(2, '0');
    final formattedTime = "$formattedHour:$formattedMinute $period";

    // Return the formatted time in the specified language.
    return isEnglish
        ? formattedTime
        : translateNumbersToArabic(formattedTime, arabicNumbers);
  } catch (e) {
    // Return an error message if the time format is invalid.
    return isEnglish ? "Invalid time" : "وقت غير صالح";
  }
}

String translateNumbersToArabic(
    String input, Map<String, String> arabicNumbers) {
  /// Converts the given string to Arabic numerals.
  /// If the input contains non-numeric characters, they are left unchanged.
  ///
  /// Parameters:
  /// - `input`: The string to be converted.
  /// - `arabicNumbers`: A map to convert individual digits to Arabic numerals.

  return input.split('').map((char) {
    return arabicNumbers[char] ?? char;
  }).join();
}

bool checkApiResponse(dynamic jsonResponse) {
  // Check if the response is a Map with a key 'message'.
  if (jsonResponse is Map<String, dynamic> &&
      jsonResponse.containsKey('message')) {
    final message = jsonResponse['message'];

    // If the message is a list, return true.
    if (message is List) {
      return true;

      // If the message is a specific string, return false.
    } else if (message is String &&
        message == "No Leave Types Percentage Data Available") {
      return false;
    }
  }

  // Default return value if conditions are not met.
  return false;
}

bool validateDataWorkingHours(dynamic body) {
  if (body == null || body is! Map<String, dynamic>) {
    return false;
  }

  var message = body['message'];

  if (message is Map) {
    return !(message['working_hours'] == "0 hr" && message['day'] == 0);
  }

  if (message is List) {
    return true;
  }

  return false;
}

double formatNumberForDashboard(double number) {
  if (number % 1 == 0) {
    // If the number is a whole number, return it as a double.
    return number.toInt().toDouble();
  }

  return double.parse(number.toStringAsFixed(1)); // Round to one decimal place.
}

String formatTimeByLanguage(
  String timeText,
  bool isEnglish,
) {
  final parts = timeText.split(':');
  if (parts.length != 2) {
    // If the time format is invalid, return the original text.
    return timeText;
  }

  final hoursPart = parts[0].trim();
  final minutesPart = parts[1].trim();

// Extract hours and minutes from the time string.
  final hours = RegExp(r'\d+').firstMatch(hoursPart)?.group(0) ?? '0';
  final minutes = RegExp(r'\d+').firstMatch(minutesPart)?.group(0) ?? '0';

  if (isEnglish) {
    // Return the formatted time in English.
    return "$hours Hours : $minutes Minute";
  } else {
    // Convert numbers to Arabic digits and return the formatted time in Arabic.
    String arabicNumbers(String input) {
      const arabicDigits = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
      return input.split('').map((char) {
        if (char.contains(RegExp(r'\d'))) {
          return arabicDigits[int.parse(char)];
        }
        return char;
      }).join('');
    }

    final arabicHours = arabicNumbers(hours);
    final arabicMinutes = arabicNumbers(minutes);
    return "$arabicHours ساعات  : $arabicMinutes دقيقة";
  }
}

String translateDay(
  String dayName,
  bool isEnglish,
) {
  if (isEnglish) {
    return dayName;
  }

  Map<String, String> daysInArabic = {
    "Sunday": "الأحد",
    "Monday": "الاثنين",
    "Tuesday": "الثلاثاء",
    "Wednesday": "الأربعاء",
    "Thursday": "الخميس",
    "Friday": "الجمعة",
    "Saturday": "السبت",
  };

  return daysInArabic[dayName] ?? dayName;
}

List<int> extractHours(List<String> workingHoursList) {
  // Initialize an empty list to store the extracted hours.
  List<int> hoursList = [];

  // Loop through each string in the provided list.
  for (String workingHours in workingHoursList) {
    // Define a regular expression to match the pattern "number + 'hrs'".
    RegExp regExp = RegExp(r"(\d+)\s*hrs");

    // Find the first match in the current string.
    var match = regExp.firstMatch(workingHours);

    if (match != null) {
      // Extract the number (group 1) and convert it to an integer.
      int hours = int.parse(match.group(1)!);
      // Add the extracted hours to the result list.
      hoursList.add(hours);
    }
  }

  // Return the final list of extracted hours.
  return hoursList;
}

String formatTimeForDashBoard(
  String time,
  bool isEnglish,
) {
  String cleanTime = time.replaceAll(RegExp(r'[^\d:]'), '');

  List<String> parts = cleanTime.split(':');

  if (parts.length == 1) {
    parts = [time.split(' ')[0], '0'];
  }

  int hours = int.parse(parts[0]);
  int minutes = parts.length > 1 ? int.parse(parts[1]) : 0;

  if (isEnglish) {
    return '$hours hrs : $minutes mins';
  } else {
    String arabicHours = convertToArabicNumeral(hours);
    String arabicMinutes = convertToArabicNumeral(minutes);
    return '$arabicHours ساعات : $arabicMinutes دقيقة';
  }
}

String convertToArabicNumeral(int number) {
  final arabicNumerals = {
    '0': '٠',
    '1': '١',
    '2': '٢',
    '3': '٣',
    '4': '٤',
    '5': '٥',
    '6': '٦',
    '7': '٧',
    '8': '٨',
    '9': '٩'
  };

  return number.toString().split('').map((digit) {
    return arabicNumerals[digit] ?? digit;
  }).join();
}

String translateState(
  List<String> state,
  List<String> stateInArabic,
  bool isEnglish,
  String searchKey,
) {
  int? index = state.indexOf(searchKey);

  // إذا كانت الكلمة موجودة في state
  if (index != -1) {
    return isEnglish ? state[index] : stateInArabic[index];
  }
  return 'Not Found State';
}

List<String> getWeeksByMonth(
  String? monthName,
  bool isEnglish,
) {
  String currentMonth = DateFormat('MMMM').format(DateTime.now());
  // Get the current month name in full format (e.g., "December").

  monthName ??= currentMonth;
  // If monthName is null, use the current month as the default.

  List<String> fourWeeksMonths = ['February'];
  // Define a list of months that typically have four weeks.

  bool isFourWeeks = fourWeeksMonths.contains(monthName);
  // Check if the given month is in the list of months with four weeks.

  List<String> weeksEnglish = isFourWeeks
      ? ['Week 1', 'Week 2', 'Week 3', 'Week 4']
      : ['Week 1', 'Week 2', 'Week 3', 'Week 4', 'Week 5'];
  // Define the week names in English based on whether the month has 4 or 5 weeks.

  List<String> weeksArabic = isFourWeeks
      ? ['الأسبوع الأول', 'الأسبوع الثاني', 'الأسبوع الثالث', 'الأسبوع الرابع']
      : [
          'الأسبوع الأول',
          'الأسبوع الثاني',
          'الأسبوع الثالث',
          'الأسبوع الرابع',
          'الأسبوع الخامس'
        ];
  // Define the week names in Arabic based on the number of weeks in the month.

  return isEnglish ? weeksEnglish : weeksArabic;
  // Return the week names in either English or Arabic based on the isEnglish flag.
}

List<String> getMonthsForYear(
  dynamic data,
  String selectedYear,
) {
  final parsedData = data is String ? jsonDecode(data) : data;

  if (parsedData is Map && parsedData.containsKey('message')) {
    final yearData = (parsedData['message'] as List).firstWhere(
      (element) => element['year'].toString() == selectedYear,
      orElse: () => {'year': '', 'months': []},
    );

    if (yearData['months'] != null) {
      return List<String>.from(yearData['months']);
    }
  }

  return [];
}

List<String> extractYears(dynamic data) {
  final parsedData = data is String ? jsonDecode(data) : data;

  if (parsedData is Map && parsedData.containsKey('message')) {
    final messageList = parsedData['message'];
    if (messageList is List) {
      return messageList
          .map((item) => item['year']?.toString() ?? '')
          .where((year) => year.isNotEmpty)
          .toList();
    }
  }
  return [];
}

bool isBodyValid(dynamic body) {
  if (body == null || body.isEmpty) {
    return false;
  }
  return true;
}

String calculateDetailedTimeAgo(
  String creationTimeString,
  bool isEnglish,
) {
  try {
    final creationTime = DateTime.parse(creationTimeString);
    final now = DateTime.now();
    final difference = now.difference(creationTime);
    final days = difference.inDays;
    final hours = difference.inHours % 24;
    final minutes = difference.inMinutes % 60;

    if (isEnglish) {
      if (days > 0) {
        return '$days days ago';
      } else if (hours > 0) {
        return '$hours hours ago';
      } else {
        return '$minutes ${minutes == 1 ? 'minute' : 'minutes'} ago';
      }
    } else {
      if (days > 0) {
        return 'منذ $days يوم';
      } else if (hours > 0) {
        return 'منذ $hours ساعة';
      } else {
        return 'منذ $minutes ${minutes == 1 ? 'دقيقة' : 'دقائق'}';
      }
    }
  } catch (e) {
    return isEnglish ? 'Invalid date format' : 'تنسيق التاريخ غير صالح';
  }
}
