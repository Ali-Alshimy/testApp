import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LoginApiCall {
  static Future<ApiCallResponse> call({
    String? usrName = '',
    String? password = '',
    String? baseUrl = '',
    String? deviceId = '',
    String? fcmToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'loginApi',
      apiUrl: '$baseUrl/api/method/talentio.api.auth.login',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'usrName': usrName,
        'password': password,
        'device_id': deviceId,
        'fcm_token': fcmToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.id''',
      ));
  static String? jopTitle(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.job_title''',
      ));
  static String? userName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.username''',
      ));
  static String? apiSecret(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.api_secret''',
      ));
  static String? fullName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.full_name''',
      ));
  static int? servicePeriod(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.message.service_period_months''',
      ));
  static String? apiKey(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.api_key''',
      ));
  static String? image(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.employee_image''',
      ));
  static String? gender(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.gender''',
      ));
  static String? department(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message.department''',
      ));
  static int? year(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.message.service_period_years''',
      ));
  static String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.email''',
      ));
  static int? debugMode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.message.debug_mode''',
      ));
  static String? manger(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.manger''',
      ));
  static double? faceDetection(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.message.face_detection_accuracy''',
      ));
  static String? company(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.company''',
      ));
  static String? checkin(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.today_check_in''',
      ));
  static String? checkout(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.today_check_out''',
      ));
}

class ContactInfoCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? userId = '',
    String? baseUrl = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Contact info',
      apiUrl: '$baseUrl/api/method/talentio.api.profile.get_contact_info',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? fristName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.personal_details.first_name''',
      ));
  static String? middleName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message.personal_details.middle_name''',
      ));
  static String? birth(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.personal_details.date_of_birth''',
      ));
  static String? mobile(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.personal_details.mobile''',
      ));
  static String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.personal_details.email''',
      ));
  static String? address(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.personal_details.address''',
      ));
  static String? personalStatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message.personal_details.marital_status''',
      ));
  static String? dateJoin(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.company_details.date_of_joining''',
      ));
  static String? designation(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message.company_details.designation''',
      ));
  static String? department(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message.company_details.department''',
      ));
  static String? companyStatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message.company_details.status''',
      ));
  static String? branch(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.company_details.branch''',
      ));
  static String? employmentType(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message.company_details.employment_type''',
      ));
  static String? emailCompany(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message.company_details.company_email''',
      ));
  static String? shift(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.company_details.default_shift''',
      ));
  static String? hip(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.company_details.HIP''',
      ));
  static String? holidayList(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message.company_details.holiday_list''',
      ));
  static String? qualifications(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message.education_details.qualification''',
      ));
  static String? level(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.education_details.level''',
      ));
  static int? yearOfPassing(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.message.education_details.year_of_passing''',
      ));
  static String? gender(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.personal_details.gender''',
      ));
  static String? schooluniv(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message.education_details.school_univ''',
      ));
  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class SalaryDetailsCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? apiKey = '',
    String? apiSecret = '',
    String? yaer = '',
    String? month = '',
    String? baseUrl = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'salary details',
      apiUrl: '$baseUrl/api/method/talentio.api.profile.get_salary_details',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
        'year': yaer,
        'month': month,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? salaries(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?;
  static String? postingDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message.details_salary.posting_date''',
      ));
  static String? currency(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.details_salary.currency''',
      ));
  static String? payrollFrequency(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message.details_salary.payroll_frequency''',
      ));
  static int? workingDays(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.message.details_salary.working_days''',
      ));
  static List? earnings(dynamic response) => getJsonField(
        response,
        r'''$.message.earnings''',
        true,
      ) as List?;
  static List<String>? salaryComponent(dynamic response) => (getJsonField(
        response,
        r'''$.message.earnings[:].salary_component''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<double>? amount(dynamic response) => (getJsonField(
        response,
        r'''$.message.earnings[:].amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List? deductions(dynamic response) => getJsonField(
        response,
        r'''$.message.deductions''',
        true,
      ) as List?;
  static String? deductionsSalaryComponent(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message.deductions[:].salary_component''',
      ));
  static double? deductionsAmount(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.message.deductions[:].amount''',
      ));
  static dynamic total(dynamic response) => getJsonField(
        response,
        r'''$.message.total''',
      );
  static double? grosspay(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.message.total.gross_pay''',
      ));
  static double? totalDeduction(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.message.total.total_deduction''',
      ));
  static double? yearToDate(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.message.total.year_to_date''',
      ));
  static double? loanRepayment(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.message.total.total_loan_repayment''',
      ));
  static double? netPay(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.message.total.net_pay''',
      ));
  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message.details_salary''',
      );
}

class OnboardingsApiCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'onboardingsApi',
      apiUrl:
          '$baseUrl/api/method/talentio.api.onboardings.get_all_onboardings',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message[:].employee_name''',
      ));
  static String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message[:].name''',
      ));
  static String? jobTitle(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message[:].designation''',
      ));
  static String? department(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message[:].department''',
      ));
  static String? dateOfJoining(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message[:].date_of_joining''',
      ));
  static String? image(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message[:].image''',
      ));
  static List? message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?;
}

class BankDetailsCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? userId = '',
    String? baseUrl = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'bankDetails',
      apiUrl: '$baseUrl/api/method/talentio.api.profile.get_bank_details',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static double? balance(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.message.balance''',
      ));
  static String? bankName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.bank_name''',
      ));
  static String? iban(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.iban''',
      ));
  static String? bankAccount(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message.bank_ac_no''',
      ));
}

class ReferralsApiCall {
  static Future<ApiCallResponse> call({
    String? baseUrl = '',
    String? apiKey = '',
    String? apiSecret = '',
    String? firstName = '',
    String? lastName = '',
    String? jobTitle = '',
    String? email = '',
    String? date = '',
    String? referrer = '',
    FFUploadedFile? resume,
    String? openedJobId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'referralsApi',
      apiUrl:
          '$baseUrl/api/method/talentio.api.referrals.create_employee_referral',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'first_name': firstName,
        'last_name': lastName,
        'job_title': jobTitle,
        'email': email,
        'date': date,
        'referrer': referrer,
        'resume': resume,
        'opened_job_id': openedJobId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReferralsJobTitlesListCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'referralsJobTitlesList',
      apiUrl: '$baseUrl/api/method/talentio.api.referrals.get_opened_jobs',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? jobList(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].job_title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? openedJobId(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? jobDescription(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? jobDepartment(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].department''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? currency(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].currency''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? status(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? lowerrangesalary(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].lower_range_salary''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? upperrangesalary(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].upper_range_salary''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? numOfPositions(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].num_of_positions''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List? message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?;
  static List<String>? company(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].company''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class MyTeamCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? userId = '',
    String? baseUrl = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'myTeam',
      apiUrl:
          '$baseUrl/api/method/talentio.api.team.get_same_department_employees',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.message.employees[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? email(dynamic response) => (getJsonField(
        response,
        r'''$.message.employees[:].email''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? jopTitle(dynamic response) => (getJsonField(
        response,
        r'''$.message.employees[:].job_title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? phone(dynamic response) => (getJsonField(
        response,
        r'''$.message.employees[:].phone''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.message.employees[:].address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? image(dynamic response) => (getJsonField(
        response,
        r'''$.message.employees[:].image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? employees(dynamic response) => getJsonField(
        response,
        r'''$.message.employees''',
        true,
      ) as List?;
  static List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.message.employees[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? status(dynamic response) => (getJsonField(
        response,
        r'''$.message.employees[:].status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? employeeCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.message.employee_count''',
      ));
}

class LeaveTypesCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'leaveTypes',
      apiUrl: '$baseUrl/api/method/talentio.api.transactions.get_leave_types',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? leaveTypes(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?;
}

class ClaimTypesCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'claimTypes',
      apiUrl:
          '$baseUrl/api/method/talentio.api.transactions.get_expense_claim_types',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? claimTypes(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class FinanceclaimCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Financeclaim',
      apiUrl:
          '$baseUrl/api/method/talentio.api.transactions.get_payable_accounts',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? loansTypes(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class TransactionStatsCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'transactionStats',
      apiUrl:
          '$baseUrl/api/method/talentio.api.transactions.get_transaction_stats',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static double? annualBalance(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.message.annual_balance''',
      ));
  static int? annualRequests(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.message.total_annual_requests''',
      ));
  static double? leaveBalance(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.message.leave_balance''',
      ));
  static int? leavesRequests(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.message.total_leaves_requests''',
      ));
  static int? totalClaims(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.message.total_claims''',
      ));
  static int? totalLoans(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.message.total_loans''',
      ));
  static int? shiftREQ(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.message.total_shift_assignments''',
      ));
  static int? totalTrainingRequests(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.message.total_training_requests''',
      ));
  static int? overTimeRequest(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.message.total_overtime_requests''',
      ));
  static int? miscellaneousRequests(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.message.total_miscellaneous_requests''',
      ));
  static int? grievanceRequests(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.message.total_Grievance_requests''',
      ));
  static int? totalAttendance(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.message.total_attendance_requests''',
      ));
}

class LeaveRequestCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? userId = '',
    String? leaveType = '',
    String? toDate = '',
    String? reason = '',
    String? fromDate = '',
    FFUploadedFile? attachment,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'leaveRequest',
      apiUrl:
          '$baseUrl/api/method/talentio.api.transactions.create_leave_request',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
        'leave_type': leaveType,
        'to_date': toDate,
        'fromDate': fromDate,
        'reason': reason,
        'attachment': attachment,
        'from_date': fromDate,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? exception(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.exception''',
      ));
}

class AnnualRequestCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? userId = '',
    String? fromDate = '',
    String? toDate = '',
    String? reason = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'annualRequest',
      apiUrl:
          '$baseUrl/api/method/talentio.api.transactions.create_annual_request',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
        'from_date': fromDate,
        'to_date': toDate,
        'reason': reason,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? exception(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.exception''',
      ));
  static String? exctype(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.exc_type''',
      ));
}

class CreateOvertimeRequestCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? userId = '',
    double? expectedOvertimeHour,
    String? attendanceDate = '',
    String? reason = '',
    String? requestType = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "$userId",
  "attendance_date": "$attendanceDate",
  "reason": "$reason",
  "request_type": "$requestType",
  "expected_overtime_hour": $expectedOvertimeHour
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createOvertimeRequest',
      apiUrl:
          '$baseUrl/api/method/talentio.api.transactions.create_overtime_request',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LoanRequestCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? userId = '',
    String? loanType = '',
    String? repaymentMethod = '',
    double? repaymentAmount,
    String? repaymentStartDate = '',
    double? loanAmount,
    String? reason = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "$userId",
  "loan_type": "$loanType",
  "repayment_method": "$repaymentMethod",
  "repayment_amount": $repaymentAmount,
  "repayment_start_date": "$repaymentStartDate",
  "loan_amount": $loanAmount,
  "reason": "$reason"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'loanRequest',
      apiUrl:
          '$baseUrl/api/method/talentio.api.transactions.create_loan_request',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LoanTypesCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'LoanTypes',
      apiUrl: '$baseUrl/api/method/talentio.api.transactions.get_loan_types',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? loanTypes(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class TrainingRequestCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? userId = '',
    String? availableDate = '',
    String? trainingProgram = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "$userId",
  "available_date": "$availableDate",
  "training_program": "$trainingProgram"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'trainingRequest',
      apiUrl:
          '$baseUrl/api/method/talentio.api.transactions.create_training_request',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class TrainingProgramsCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'trainingPrograms',
      apiUrl:
          '$baseUrl/api/method/talentio.api.transactions.get_training_programs',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? trainingType(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message[:].name''',
      ));
  static List? message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?;
}

class ClaimRequestCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? userId = '',
    String? postingDate = '',
    dynamic expensesJson,
    List<FFUploadedFile>? filesList,
  }) async {
    final files = filesList ?? [];
    final expenses = _serializeJson(expensesJson, true);

    return ApiManager.instance.makeApiCall(
      callName: 'claimRequest',
      apiUrl:
          '$baseUrl/api/method/talentio.api.transactions.create_financial_claim_request',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
        'posting_date': postingDate,
        'expenses': expenses,
        'files': files,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EmployeeCoursesCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'employeeCourses',
      apiUrl: '$baseUrl/api/method/talentio.api.profile.get_employee_courses',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? courses(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?;
  static List<String>? courseName(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].course''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? image(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].certificate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? addedBy(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].added_by''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? date(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].course_year''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class EmployeeAttachmentCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'employeeAttachment',
      apiUrl:
          '$baseUrl/api/method/talentio.api.profile.get_employee_appointments',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? attachmentList(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?;
  static List? appointments(dynamic response) => getJsonField(
        response,
        r'''$.message.appointments''',
        true,
      ) as List?;
  static List<String>? document(dynamic response) => (getJsonField(
        response,
        r'''$.message.appointments[:].document''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? file(dynamic response) => (getJsonField(
        response,
        r'''$.message.appointments[:].file''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$.message.appointments[:].date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? num(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.message.required_files_num''',
      ));
  static int? missing(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.message.missing_files_num''',
      ));
}

class AttendanceRequestCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? userId = '',
    String? fromDate = '',
    String? toDate = '',
    String? reason = '',
    String? explanation = '',
    bool? halfDay,
    String? date = '',
    String? baseUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "$userId",
  "reason": "$reason",
  "explanation": "$explanation",
  "half_day": $halfDay,
  "from_date": "$fromDate",
  "to_date": "$toDate",
  "date": "$date"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'attendanceRequest',
      apiUrl:
          '$baseUrl/api/method/talentio.api.transactions.create_attendance_request',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? attendance(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class ShiftAssignmentCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? userId = '',
    String? startDate = '',
    String? endDate = '',
    String? shiftType = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'shiftAssignment',
      apiUrl:
          '$baseUrl/api/method/talentio.api.transactions.create_shift_request',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
        'start_date': startDate,
        'end_date': endDate,
        'shiftType': shiftType,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? exception(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.exception''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? exctype(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.exc_type''',
      ));
  static String? servermessages(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$._server_messages''',
      ));
}

class ShiftTypesCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'shiftTypes',
      apiUrl: '$baseUrl/api/method/talentio.api.transactions.get_shift_types',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? reason(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?;
}

class AttendanceReasonCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? userId = '',
    String? baseUrl = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'attendanceReason',
      apiUrl:
          '$baseUrl/api/method/talentio.api.transactions.get_select_fields_values?doc_type=Attendance Request&field_name=reason',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? reasonFromAttendance(dynamic response) => (getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class UserAnnualREQCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? userId = '',
    String? timePeriod = '',
    String? status = '',
    String? startDate = '',
    String? endDate = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'userAnnualREQ',
      apiUrl:
          '$baseUrl/api/method/talentio.api.user_requests.get_annual_requests',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
        'time_period': timePeriod,
        'status': status,
        'start_date': startDate,
        'end_date': endDate,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? requestAnnual(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?;
  static List<String>? status(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? exception(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.exception''',
      ));
}

class UserShiftReqCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? userId = '',
    String? baseUrl = '',
    String? timePeriod = '',
    String? status = '',
    String? startDate = '',
    String? endDate = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'userShiftReq',
      apiUrl:
          '$baseUrl/api/method/talentio.api.user_requests.get_shift_requests',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
        'time_period': timePeriod,
        'status': status,
        'start_date': startDate,
        'end_date': endDate,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message[:].status''',
      ));
  static List? message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?;
}

class UserOverTimeReqCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? userId = '',
    String? timePeriod = '',
    String? status = '',
    String? startDate = '',
    String? endDate = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'userOverTimeReq',
      apiUrl:
          '$baseUrl/api/method/talentio.api.user_requests.get_overtime_requests',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
        'time_period': timePeriod,
        'status': status,
        'start_date': startDate,
        'end_date': endDate,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?;
  static String? employeeName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message[:].employee_name''',
      ));
  static String? department(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message[:].department''',
      ));
  static String? attendanceDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message[:].attendance_date''',
      ));
  static int? expectedoverTimeHour(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.message[:].expected_overtime_hour''',
      ));
  static String? requestType(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message[:].request_type''',
      ));
  static String? reason(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message[:].reason''',
      ));
}

class UserLeaveREQCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? userId = '',
    String? baseUrl = '',
    String? timePeriod = '',
    String? status = '',
    String? startDate = '',
    String? endDate = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'userLeaveREQ',
      apiUrl:
          '$baseUrl/api/method/talentio.api.user_requests.get_leave_requests',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
        'time_period': timePeriod,
        'status': status,
        'start_date': startDate,
        'end_date': endDate,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?;
  static List<String>? employeename(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].employee_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? department(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].department''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? fromdate(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].from_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? todate(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].to_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leavetype(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].leave_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? reason(dynamic response) => getJsonField(
        response,
        r'''$.message[:].reason''',
        true,
      ) as List?;
}

class UserTrainingREQCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? userId = '',
    String? baseUrl = '',
    String? timePeriod = '',
    String? status = '',
    String? startDate = '',
    String? endDate = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'userTrainingREQ',
      apiUrl:
          '$baseUrl/api/method/talentio.api.user_requests.get_training_requests',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
        'time_period': timePeriod,
        'status': status,
        'start_date': startDate,
        'end_date': endDate,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?;
}

class UserExpenseClaimREQCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? userId = '',
    String? baseUrl = '',
    String? timePeriod = '',
    String? status = '',
    String? startDate = '',
    String? endDate = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'userExpenseClaimREQ',
      apiUrl:
          '$baseUrl/api/method/talentio.api.user_requests.get_expense_claim_requests',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
        'time_period': timePeriod,
        'status': status,
        'start_date': startDate,
        'end_date': endDate,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?;
  static List<String>? employeeName(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].employee_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? department(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].department''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? postingDate(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].posting_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? expenseStatus(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].expense_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? expenseClaimType(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].expense_claim_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? allowed(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].allowed''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class UserLoansREQCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? userId = '',
    String? baseUrl = '',
    String? timePeriod = '',
    String? status = '',
    String? startDate = '',
    String? endDate = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'userLoansREQ',
      apiUrl:
          '$baseUrl/api/method/talentio.api.user_requests.get_loan_requests',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
        'time_period': timePeriod,
        'status': status,
        'start_date': startDate,
        'end_date': endDate,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? postingdate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message[:].posting_date''',
      ));
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message[:].status''',
      ));
  static String? loantype(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message[:].loan_type''',
      ));
  static int? loanamount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.message[:].loan_amount''',
      ));
  static int? repaymentperiods(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.message[:].repayment_periods''',
      ));
  static int? repaymentamount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.message[:].repayment_amount''',
      ));
  static List? message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?;
}

class GetEmployeeAttendanceCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? employeeId = '',
    String? baseUrl = '',
    int? isMissing,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getEmployeeAttendance',
      apiUrl:
          '$baseUrl/api/method/talentio.api.attendance.get_employee_attendance',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'employee_id': employeeId,
        'is_missing': isMissing,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? checkInDate(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].check_in_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? workingHours(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].working_hours''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? checkInTime(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].check_in_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? checkOutTime(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].check_out_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? checkOutDate(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].check_out_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? checkInDay(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].check_in_day''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?;
}

class UserAttendanceREQCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? userId = '',
    String? baseUrl = '',
    String? timePeriod = '',
    String? status = '',
    String? startDate = '',
    String? endDate = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'userAttendanceREQ',
      apiUrl:
          '$baseUrl/api/method/talentio.api.user_requests.get_attendance_requests',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
        'time_period': timePeriod,
        'status': status,
        'start_date': startDate,
        'end_date': endDate,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?;
  static List<String>? halfDay(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].half_day_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetStatusTransactionsCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? docType = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getStatusTransactions',
      apiUrl:
          '$baseUrl/api/method/talentio.api.user_requests.get_possible_workflow',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'doctype': docType,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? state(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].state''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? stateinarabic(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].state_in_arabic''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class WorkFlowActionCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? doctype = '',
    String? docName = '',
    String? action = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'workFlowAction',
      apiUrl:
          '$baseUrl/api/method/talentio.api.workflow.apply_workflow_action',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'doctype': doctype,
        'doc_name': docName,
        'action': action,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class OthersApprovalsRequestsCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? userEmail = '',
    String? baseUrl = '',
    String? doctype = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'othersApprovalsRequests',
      apiUrl:
          '$baseUrl/api/method/talentio.api.approvals.get_others_requests',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'doctype': doctype,
        'user_email': userEmail,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? creationdate(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].creation_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? docUrl(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].doc_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? nextactions(dynamic response) => getJsonField(
        response,
        r'''$.message[:].next_actions''',
        true,
      ) as List?;
  static List<String>? currentstatus(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].current_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? nextuser(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].next_user''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? doctype(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].doctype''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?;
}

class DownloadOthersDocumentCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? docId = '',
    String? doctype = '',
    String? baseUrl = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'downloadOthersDocument',
      apiUrl:
          '$baseUrl/api/method/talentio.api.approvals.download_document_pdf',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'doc_id': docId,
        'doctype': doctype,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetDoctypesCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getDoctypes',
      apiUrl:
          '$baseUrl/api/method/talentio.api.approvals.get_others_doctypes',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? messageDoctypes(dynamic response) => (getJsonField(
        response,
        r'''$.message.doctypes''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ApplyActionsCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? userEmail = '',
    String? doctype = '',
    String? docId = '',
    String? action = '',
    String? baseUrl = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'applyActions',
      apiUrl: '$baseUrl/api/method/talentio.api.approvals.apply_actions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'user_email': userEmail,
        'doctype': doctype,
        'doc_id': docId,
        'action': action,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class HrRequestsCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? userEmail = '',
    String? doctype = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'hrRequests',
      apiUrl: '$baseUrl/api/method/talentio.api.approvals.get_hr_requests',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'user_email': userEmail,
        'doctype': doctype,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? currentStatus(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].current_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? creationDate(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].creation_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?;
  static List<String>? docId(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? doctype(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].doctype''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? nextUser(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].next_user''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? nextAction(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].next_actions''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? employeeId(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].employee''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? type(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].leave_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? fromDate(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].from_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? toDate(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].to_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class SalaryMonthAndYearCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'salaryMonthAndYear',
      apiUrl:
          '$baseUrl/api/method/talentio.api.profile.get_salary_month_and_year',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<int>? year(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].year''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List? message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?;
  static List<String>? months(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].months''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class KpisCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Kpis',
      apiUrl: '$baseUrl/api/method/talentio.api.KPIs.get_employee_kpis',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static double? lastSalary(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.message.last_employee_salary''',
      ));
  static int? annual(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.message.annual_leaves_taken''',
      ));
  static int? sick(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.message.total_sick_leaves_taken''',
      ));
  static double? loans(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.message.total_remaining_loans_amount''',
      ));
  static int? overTime(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.message.employee_approved_overtime_requests''',
      ));
}

class LastTransactionCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'lastTransaction ',
      apiUrl:
          '$baseUrl/api/method/talentio.api.transactions.get_latest_transactions',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? status(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? type(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].creation_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? value(dynamic response) => getJsonField(
        response,
        r'''$.message[:].value''',
        true,
      ) as List?;
  static List? message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?;
}

class EmployeeCheckInAndOutCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? userId = '',
    String? logType = '',
    String? time = '',
    String? location = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'employeeCheckInAndOut',
      apiUrl:
          '$baseUrl/api/method/talentio.api.transactions.create_employee_check_in_or_out',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
        'log_type': logType,
        'time': time,
        'location': location,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MiscellaneousTypesCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'miscellaneousTypes',
      apiUrl:
          '$baseUrl/api/method/talentio.api.transactions.get_miscellaneous_request_types',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?;
}

class CreateMiscellaneousRequestCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? userId = '',
    String? requestType = '',
    String? explanation = '',
    String? date = '',
    FFUploadedFile? attachment,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'createMiscellaneousRequest',
      apiUrl:
          '$baseUrl/api/method/talentio.api.transactions.create_miscellaneous_request',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
        'request_type': requestType,
        'date': date,
        'explanation': explanation,
        'attachment': attachment,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UserMiscellaneousRequestsCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? userId = '',
    String? baseUrl = '',
    String? status = '',
    String? timePeriod = '',
    String? startDate = '',
    String? endDate = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'userMiscellaneousRequests',
      apiUrl:
          '$baseUrl/api/method/talentio.api.user_requests.get_miscellaneous_requests',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
        'status': status,
        'time_period': timePeriod,
        'start_date': startDate,
        'end_date': endDate,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? miscellaneous(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?;
}

class LeaveBalanceCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'leaveBalance',
      apiUrl:
          '$baseUrl/api/method/talentio.api.leave_balance_stats.get_total_leave_balance',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static List<String>? leavetype(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].leave_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? leavesAllocated(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].total_leaves_allocated''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? usedLeaves(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].used_leaves''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? availableBalance(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].available_balance''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class LeavesStatsXAndYCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? userId = '',
    String? year = '',
    String? month = '',
    String? baseUrl = '',
    String? leaveType = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'leavesStatsXAndY',
      apiUrl:
          '$baseUrl/api/method/talentio.api.leave_balance_stats.get_leaves_stats',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
        'year': year,
        'month': month,
        'leave_type': leaveType,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<int>? dayX(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].day''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? leavesY(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].leaves''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveType(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].leave_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?;
}

class LeaveTypesPercentageForPieChartCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'leaveTypesPercentageForPieChart',
      apiUrl:
          '$baseUrl/api/method/talentio.api.leave_balance_stats.get_leave_types_percentage',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?;
  static List<String>? employee(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].employee''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveType(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].leave_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<double>? leaves(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].leaves''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<double>? percentage(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].percentage''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
}

class OverTimeRequestTypeCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? userId = '',
    String? docType = '',
    String? fieldName = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'overTimeRequestType',
      apiUrl:
          '$baseUrl/api/method/talentio.api.transactions.get_select_fields_values',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
        'doc_type': docType,
        'field_name': fieldName,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? message(dynamic response) => (getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class LeavesMonthAndYearCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'leavesMonthAndYear',
      apiUrl:
          '$baseUrl/api/method/talentio.api.leave_balance_stats.get_leaves_month_and_year',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<int>? year(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].year''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List? message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?;
  static List<String>? months(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].months''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetWorkingHoursStatsCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? userId = '',
    String? month = '',
    String? year = '',
    String? week = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getWorkingHoursStats',
      apiUrl:
          '$baseUrl/api/method/talentio.api.leave_balance_stats.get_working_hours_stats',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
        'month': month,
        'year': year,
        'week': week,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?;
  static List<String>? employee(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].employee''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? month(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].month''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? week(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].week''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? day(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].day''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? workinghours(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].working_hours''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? dayname(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].day_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class AvailableLeaveBalanceCall {
  static Future<ApiCallResponse> call({
    String? apiSecret = '',
    String? apiKey = '',
    String? baseUrl = '',
    String? userId = '',
    String? leaveType = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'availableLeaveBalance',
      apiUrl:
          '$baseUrl/api/method/talentio.api.leave_balance_stats.get_available_leave_balance',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
        'leave_type': leaveType,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? availableBalance(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.message.available_balance''',
      ));
  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class GetEmployeeLeaveTypeCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? userId = '',
    String? baseUrl = '',
    String? year = '',
    String? month = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getEmployeeLeaveType',
      apiUrl:
          '$baseUrl/api/method/talentio.api.leave_balance_stats.get_employee_leave_type',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
        'year': year,
        'month': month,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? leavetype(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].leave_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetEmployeeCheckinCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? userId = '',
    String? baseUrl = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getEmployeeCheckin',
      apiUrl:
          '$baseUrl/api/method/talentio.api.attendance.get_employee_checkin',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? checkin(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.today_check_in''',
      ));
  static String? checkout(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.today_check_out''',
      ));
}

class CreateEmployeeGrievanceCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? userId = '',
    String? subject = '',
    String? date = '',
    String? grievanceAgainstParty = '',
    String? grievanceAgainst = '',
    String? grievanceType = '',
    String? description = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'createEmployeeGrievance',
      apiUrl:
          '$baseUrl/api/method/talentio.api.transactions.create_employee_grievance',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
        'subject': subject,
        'date': date,
        'grievance_against_party': grievanceAgainstParty,
        'grievance_against': grievanceAgainst,
        'grievance_type': grievanceType,
        'description': description,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GrievanceAgainstPartyCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'grievanceAgainstParty',
      apiUrl:
          '$baseUrl/api/method/talentio.api.transactions.get_grievance_against_party',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? messageName(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GrievanceaGainstCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? userId = '',
    String? grievanceParty = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'grievanceaGainst',
      apiUrl:
          '$baseUrl/api/method/talentio.api.transactions.get_grievance_against',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
        'grievance_party': grievanceParty,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?;
  static List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? mployeeName(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].employee_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetGrievanceTypesCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getGrievanceTypes',
      apiUrl:
          '$baseUrl/api/method/talentio.api.transactions.get_grievance_types',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? types(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetGrievanceRequestsCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? userId = '',
    String? baseUrl = '',
    String? status = '',
    String? timePeriod = '',
    String? startDate = '',
    String? endDate = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getGrievanceRequests',
      apiUrl:
          '$baseUrl/api/method/talentio.api.user_requests.get_grievance_requests',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'userId': userId,
        'status': status,
        'time_period': timePeriod,
        'start_date': startDate,
        'end_date': endDate,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?;
}

class GrievanceStatusCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? docType = '',
    String? fieldName = '',
    String? baseUrl = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'grievanceStatus',
      apiUrl:
          '$baseUrl/api/method/talentio.api.transactions.get_select_fields_values',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'doc_type': docType,
        'field_name': fieldName,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? message(dynamic response) => (getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CompanyPolicyCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? company = '',
    String? apiSecret = '',
    String? baseUrl = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'companyPolicy',
      apiUrl:
          '$baseUrl/api/method/talentio.api.company_policy.get_company_policy',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'api_key': apiKey,
        'company': company,
        'api_secret': apiSecret,
        'baseUrl': baseUrl,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? description(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message.description''',
      ));
  static String? descriptionAr(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message.description_ar''',
      ));
}

class GetAllNotificationsCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? mobileApp = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllNotifications',
      apiUrl:
          '$baseUrl/api/method/notification_hub.api.notification.get_all_notifications',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'mobile_app': mobileApp,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].creation''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? message(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].message''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? documentType(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].document_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? subject(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].subject''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? isViewed(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].is_viewed''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List? messages(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?;
  static List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class NumberOfUnreadNotificationsCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? mobileApp = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'numberOfUnreadNotifications',
      apiUrl:
          '$baseUrl/api/method/notification_hub.api.notification.get_number_of_unread_notifications',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'mobile_app': mobileApp,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic count(dynamic response) => getJsonField(
        response,
        r'''$.message.count''',
      );
}

class MarkNotificationsAsReadCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? mobileApp = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'markNotificationsAsRead',
      apiUrl:
          '$baseUrl/api/method/notification_hub.api.notification.mark_notifications_as_read',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'mobile_app': mobileApp,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MarkSingleNotificationCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? id = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'markSingleNotification',
      apiUrl:
          '$baseUrl/api/method/notification_hub.api.notification.mark_single_notification_as_read',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'id': id,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UnreadNotificationsCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '',
    String? apiSecret = '',
    String? baseUrl = '',
    String? mobileApp = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'UnreadNotifications',
      apiUrl:
          '$baseUrl/api/method/notification_hub.api.notification.get_unread_notifications',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'token $apiKey:$apiSecret',
      },
      params: {
        'mobile_app': mobileApp,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].creation''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? subject(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].subject''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? type(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].document_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? body(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].message''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?;
  static List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.message[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
