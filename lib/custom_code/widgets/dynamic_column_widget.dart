// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

// Abstract base class for documents
abstract class Document {
  String id;
  String doctype;
  String currentStatus;
  String nextUser;
  String creationDate;

  Document({
    required this.id,
    required this.doctype,
    required this.currentStatus,
    required this.nextUser,
    required this.creationDate,
  });

  // Factory method to create instances based on doctype
  factory Document.fromJson(Map<String, dynamic> json) {
    switch (json['doctype']) {
      case 'Loan Application':
        return LoanApplication.fromJson(json);
      case 'Leave Application':
        return LeaveApplication.fromJson(json);
      case 'Overtime Request':
        return OverTimeRequest.fromJson(json);
      case 'Expense Claim':
        return ExpenseClaim.fromJson(json);
      case 'Training Request':
        return TrainingRequest.fromJson(json);
      case 'Attendance Request':
        return AttendanceRequest.fromJson(json);
      case 'Shift Request':
        return ShiftRequest.fromJson(json);
      default:
        throw Exception('Unknown document type');
    }
  }
}

// LoanApplication class extending Document
class LoanApplication extends Document {
  String applicant;
  String type;
  double loanAmount;
  String repaymentMethod;
  double repaymentAmount;

  LoanApplication({
    required String id,
    required String doctype,
    required String currentStatus,
    required String nextUser,
    required String creationDate,
    required this.applicant,
    required this.type,
    required this.loanAmount,
    required this.repaymentMethod,
    required this.repaymentAmount,
  }) : super(
            id: id,
            doctype: doctype,
            currentStatus: currentStatus,
            nextUser: nextUser,
            creationDate: creationDate);

  // Factory method to create an instance from JSON
  factory LoanApplication.fromJson(Map<String, dynamic> json) {
    return LoanApplication(
      id: json['id'],
      doctype: json['doctype'],
      currentStatus: json['current_status'],
      nextUser: json['next_user'],
      creationDate: json['creation_date'],
      applicant: json['applicant'],
      type: json['type'],
      loanAmount: json['loan_amount'],
      repaymentMethod: json['repayment_method'],
      repaymentAmount: json['repayment_amount'],
    );
  }
}

// LeaveApplication class extending Document
class LeaveApplication extends Document {
  String employee;
  String type;
  String fromDate;
  String toDate;
  String? description;

  LeaveApplication({
    required String id,
    required String doctype,
    required String currentStatus,
    required String nextUser,
    required String creationDate,
    required this.employee,
    required this.type,
    required this.fromDate,
    required this.toDate,
    this.description,
  }) : super(
            id: id,
            doctype: doctype,
            currentStatus: currentStatus,
            nextUser: nextUser,
            creationDate: creationDate);

  // Factory method to create an instance from JSON
  factory LeaveApplication.fromJson(Map<String, dynamic> json) {
    return LeaveApplication(
      id: json['id'],
      doctype: json['doctype'],
      currentStatus: json['current_status'],
      nextUser: json['next_user'],
      creationDate: json['creation_date'],
      employee: json['employee'],
      type: json['type'],
      fromDate: json['from_date'],
      toDate: json['to_date'],
      description: json['description'],
    );
  }
}

//Over Time Class
class OverTimeRequest extends Document {
  String employee;
  String jopTitle;
  String? department;
  String attendanceDate;
  double expectedOvertimeHour;
  String type;
  String reason;

  OverTimeRequest({
    required String id,
    required String doctype,
    required String currentStatus,
    required String nextUser,
    required String creationDate,
    required this.employee,
    required this.jopTitle,
    this.department,
    required this.attendanceDate,
    required this.expectedOvertimeHour,
    required this.type,
    required this.reason,
  }) : super(
            id: id,
            doctype: doctype,
            currentStatus: currentStatus,
            nextUser: nextUser,
            creationDate: creationDate);

  // Factory method to create an instance from JSON
  factory OverTimeRequest.fromJson(Map<String, dynamic> json) {
    return OverTimeRequest(
      id: json['id'],
      doctype: json['doctype'],
      currentStatus: json['current_status'],
      nextUser: json['next_user'],
      creationDate: json['creation_date'],
      employee: json['employee'],
      jopTitle: json['job_title'],
      department: json['department'],
      attendanceDate: json['attendance_date'],
      expectedOvertimeHour: json['expected_overtime_hour'],
      type: json['type'],
      reason: json['reason'],
    );
  }
}

//Expense Claim
class ExpenseClaim extends Document {
  String employee;
  String jopTitle;
  String? department;
  String postingDate;

  ExpenseClaim({
    required String id,
    required String doctype,
    required String currentStatus,
    required String nextUser,
    required String creationDate,
    required this.employee,
    required this.jopTitle,
    this.department,
    required this.postingDate,
  }) : super(
            id: id,
            doctype: doctype,
            currentStatus: currentStatus,
            nextUser: nextUser,
            creationDate: creationDate);

  // Factory method to create an instance from JSON
  factory ExpenseClaim.fromJson(Map<String, dynamic> json) {
    return ExpenseClaim(
      id: json['id'],
      doctype: json['doctype'],
      currentStatus: json['current_status'],
      nextUser: json['next_user'],
      creationDate: json['creation_date'],
      employee: json['employee'],
      jopTitle: json['job_title'],
      department: json['department'],
      postingDate: json['posting_date'],
    );
  }
}

//Training Request
class TrainingRequest extends Document {
  String employee;
  String jopTitle;
  String? department;
  String trainingProgram;
  String availableDate;

  TrainingRequest({
    required String id,
    required String doctype,
    required String currentStatus,
    required String nextUser,
    required String creationDate,
    required this.employee,
    required this.jopTitle,
    this.department,
    required this.trainingProgram,
    required this.availableDate,
  }) : super(
            id: id,
            doctype: doctype,
            currentStatus: currentStatus,
            nextUser: nextUser,
            creationDate: creationDate);

  // Factory method to create an instance from JSON
  factory TrainingRequest.fromJson(Map<String, dynamic> json) {
    return TrainingRequest(
        id: json['id'],
        doctype: json['doctype'],
        currentStatus: json['current_status'],
        nextUser: json['next_user'],
        creationDate: json['creation_date'],
        employee: json['employee'],
        jopTitle: json['job_title'],
        department: json['department'],
        availableDate: json['available_date'],
        trainingProgram: json['training_program']);
  }
}

//Attendance  Request
class AttendanceRequest extends Document {
  String employee;
  String jopTitle;
  String? department;
  String fromDATE;
  String toDate;
  String reason;
  int? halfDay;
  String? halfDayDate;
  String? explanation;

  AttendanceRequest({
    required String id,
    required String doctype,
    required String currentStatus,
    required String nextUser,
    required String creationDate,
    required this.employee,
    required this.jopTitle,
    this.department,
    required this.fromDATE,
    required this.toDate,
    required this.reason,
    this.halfDay,
    this.halfDayDate,
    this.explanation,
  }) : super(
            id: id,
            doctype: doctype,
            currentStatus: currentStatus,
            nextUser: nextUser,
            creationDate: creationDate);

  // Factory method to create an instance from JSON
  factory AttendanceRequest.fromJson(Map<String, dynamic> json) {
    return AttendanceRequest(
        id: json['id'],
        doctype: json['doctype'],
        currentStatus: json['current_status'],
        nextUser: json['next_user'],
        creationDate: json['creation_date'],
        employee: json['employee'],
        jopTitle: json['job_title'],
        department: json['department'],
        fromDATE: json['from_date'],
        toDate: json['to_date'],
        reason: json['reason'],
        explanation: json['explanation'] ?? null,
        halfDay: json['half_day'] ?? null,
        halfDayDate: json['half_day_date'] ?? null);
  }
}

//Attendance  Request
class ShiftRequest extends Document {
  String employee;
  String jopTitle;
  String? department;
  String toDate;
  String fromDate;
  String type;

  ShiftRequest(
      {required String id,
      required String doctype,
      required String currentStatus,
      required String nextUser,
      required String creationDate,
      required this.employee,
      required this.jopTitle,
      this.department,
      required this.fromDate,
      required this.toDate,
      required this.type})
      : super(
            id: id,
            doctype: doctype,
            currentStatus: currentStatus,
            nextUser: nextUser,
            creationDate: creationDate);

  // Factory method to create an instance from JSON
  factory ShiftRequest.fromJson(Map<String, dynamic> json) {
    return ShiftRequest(
      id: json['id'],
      doctype: json['doctype'],
      currentStatus: json['current_status'],
      nextUser: json['next_user'],
      creationDate: json['creation_date'],
      employee: json['employee'],
      jopTitle: json['job_title'],
      department: json['department'],
      fromDate: json['from_date'],
      toDate: json['to_date'],
      type: json['type'],
    );
  }
}

class DynamicColumnWidget extends StatefulWidget {
  const DynamicColumnWidget(
      {super.key, this.width, this.height, required this.jsonResponse});

  final double? width;
  final double? height;
  final dynamic jsonResponse;

  @override
  State<DynamicColumnWidget> createState() => _DynamicColumnWidgetState();
}

class _DynamicColumnWidgetState extends State<DynamicColumnWidget> {
  @override
  Widget build(BuildContext context) {
    Document doc = Document.fromJson(widget.jsonResponse);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(7.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'ID: ${doc.id}',
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
            ),
            Text(
              'Doctype: ${doc.doctype}',
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
            ),
            Text(
              'Status: ${doc.currentStatus}',
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
            ),
            Text(
              'Next User: ${doc.nextUser}',
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
            ),
            Text(
              'Creation Date: ${doc.creationDate}',
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
            ),
            if (doc is LoanApplication) ...[
              Text(
                'Applicant: ${doc.applicant}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
              Text(
                'Type: ${doc.type}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
              Text(
                'Loan Amount: ${doc.loanAmount}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
              Text(
                'Repayment Method: ${doc.repaymentMethod}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
              Text(
                'Repayment Amount: ${doc.repaymentAmount}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
            ],
            if (doc is LeaveApplication) ...[
              Text(
                'Employee: ${doc.employee}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
              Text(
                'Type: ${doc.type}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
              Text(
                'From Date: ${doc.fromDate}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
              Text(
                'To Date: ${doc.toDate}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
              if (doc.description != null)
                Text(
                  'Description: ${doc.description}',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
                ),
            ],
            if (doc is OverTimeRequest) ...[
              Text(
                'Employee: ${doc.employee}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
              Text(
                'Job Title: ${doc.jopTitle}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
              if (doc.department != null)
                Text(
                  'Department: ${doc.department}',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
                ),
              Text(
                'Attendance Date: ${doc.attendanceDate}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
              Text(
                'Expected Overtime Hours: ${doc.expectedOvertimeHour}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
              Text(
                'Type: ${doc.type}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
              Text(
                'Reason: ${doc.reason}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
            ],
            if (doc is ExpenseClaim) ...[
              Text(
                'Employee: ${doc.employee}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
              Text(
                'Job Title: ${doc.jopTitle}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
              if (doc.department != null)
                Text(
                  'Department: ${doc.department}',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
                ),
              Text(
                'Posting Date: ${doc.postingDate}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
            ],
            if (doc is TrainingRequest) ...[
              Text(
                'Employee: ${doc.employee}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
              Text(
                'Job Title: ${doc.jopTitle}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
              if (doc.department != null)
                Text(
                  'Department: ${doc.department}',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
                ),
              Text(
                'Training Program: ${doc.trainingProgram}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
              Text(
                'Available Date: ${doc.availableDate}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
            ],
            if (doc is AttendanceRequest) ...[
              Text(
                'Employee: ${doc.employee}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
              Text(
                'Job Title: ${doc.jopTitle}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
              if (doc.department != null)
                Text(
                  'Department: ${doc.department}',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
                ),
              Text(
                'From Date: ${doc.fromDATE}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
              Text(
                'To Date: ${doc.toDate}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
              Text(
                'Reason: ${doc.reason}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
              if (doc.halfDay != null)
                Text(
                  'Half Day: ${doc.halfDay}',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
                ),
              if (doc.halfDayDate != null)
                Text(
                  'Half Day Date: ${doc.halfDayDate}',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
                ),
              if (doc.explanation != null)
                Text(
                  'Explanation: ${doc.explanation}',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
                ),
            ],
            if (doc is ShiftRequest) ...[
              Text(
                'Employee: ${doc.employee}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
              Text(
                'Job Title: ${doc.jopTitle}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
              if (doc.department != null)
                Text(
                  'Department: ${doc.department}',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
                ),
              Text(
                'From Date: ${doc.fromDate}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
              Text(
                'To Date: ${doc.toDate}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
              Text(
                'Type: ${doc.type}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
