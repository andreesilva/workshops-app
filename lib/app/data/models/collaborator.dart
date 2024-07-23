class CollaboratorModel {
  int id;
  String name;
  DateTime createdAt;
  DateTime updateAt;

  CollaboratorModel(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.updateAt});

  factory CollaboratorModel.fromJson(Map<String, dynamic> json) =>
      CollaboratorModel(
        id: json['id'],
        name: json['name'],
        createdAt: DateTime.parse(json['createdAt']),
        updateAt: DateTime.parse(json['updateAt']),
      );
}
