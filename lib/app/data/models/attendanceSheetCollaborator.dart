import 'package:workshops_app/app/data/models/collaborator.dart';

class AttendanceSheetCollaboratorModel {
  int id;
  int attendanceSheetId;
  int collaboratorId;
  DateTime createdAt;
  DateTime updateAt;
  CollaboratorModel collaborator;

  AttendanceSheetCollaboratorModel(
      {required this.id,
      required this.attendanceSheetId,
      required this.collaboratorId,
      required this.createdAt,
      required this.updateAt,
      required this.collaborator});

  factory AttendanceSheetCollaboratorModel.fromJson(
          Map<String, dynamic> json) =>
      AttendanceSheetCollaboratorModel(
        id: json['id'],
        attendanceSheetId: json['attendanceSheetId'],
        collaboratorId: json['collaboratorId'],
        createdAt: DateTime.parse(json['createAt']),
        updateAt: DateTime.parse(json['updateAt']),
        collaborator: CollaboratorModel.fromJson(json['collaborator']),
      );
}
