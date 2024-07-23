import 'package:workshops_app/app/data/models/attendanceSheetCollaborator.dart';

class AttendanceSheetModel {
  int id;
  int workshopId;

  List<AttendanceSheetCollaboratorModel>? attendanceSheetCollaborators;

  AttendanceSheetModel(
      {required this.id,
      required this.workshopId,
      required this.attendanceSheetCollaborators});

  factory AttendanceSheetModel.fromJson(Map<String, dynamic> json) =>
      AttendanceSheetModel(
        id: json['id'],
        workshopId: json['workshopId'],
        attendanceSheetCollaborators: json['attendanceSheetCollaborators'] !=
                null
            ? List<AttendanceSheetCollaboratorModel>.from(
                json['attendanceSheetCollaborators']
                    .map((x) => AttendanceSheetCollaboratorModel.fromJson(x)))
            : null,
      );
}
