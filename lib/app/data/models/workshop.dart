import 'package:workshops_app/app/data/models/attendanceSheet.dart';
import 'package:workshops_app/app/data/models/attendanceSheetCollaborator.dart';
import 'package:workshops_app/app/data/models/collaborator.dart';

class WorkshopModel {
  int id;
  String name;
  DateTime dateCompletion;
  String description;
  DateTime createdAt;
  DateTime updateAt;

  List<AttendanceSheetModel> attendanceSheet;

  WorkshopModel({
    required this.id,
    required this.name,
    required this.dateCompletion,
    required this.description,
    required this.createdAt,
    required this.updateAt,
    required this.attendanceSheet,
  });

  factory WorkshopModel.fromJson(Map<String, dynamic> json) => WorkshopModel(
      id: json['id'],
      name: json['name'],
      dateCompletion: DateTime.parse(json['dateCompletion']),
      description: json['description'],
      createdAt: DateTime.parse(json['createdAt']),
      updateAt: DateTime.parse(json['updateAt']),
      attendanceSheet: List<AttendanceSheetModel>.from(json['attendanceSheet']
          .map((x) => AttendanceSheetModel.fromJson(x))));
}
