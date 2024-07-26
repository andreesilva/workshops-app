import 'package:workshops_app/app/data/models/attendanceSheetCollaborator.dart';

class AttendanceSheetModel {
  int id;
  int workshopId;
  DateTime createdAt;
  DateTime updateAt;
  List<AttendanceSheetCollaboratorModel>? attendanceSheetCollaborator;

  AttendanceSheetModel(
      {required this.id,
      required this.workshopId,
      required this.createdAt,
      required this.updateAt,
      required this.attendanceSheetCollaborator});

  factory AttendanceSheetModel.fromJson(Map<String, dynamic> json) =>
      AttendanceSheetModel(
        id: json['id'],
        workshopId: json['workshopId'],
        createdAt: DateTime.parse(json['createAt']),
        updateAt: DateTime.parse(json['updateAt']),
        attendanceSheetCollaborator: json['attendanceSheetCollaborator'] != null
            ? List<AttendanceSheetCollaboratorModel>.from(
                json['attendanceSheetCollaborator']
                    .map((x) => AttendanceSheetCollaboratorModel.fromJson(x)))
            : null,
      );
}
