import 'package:workshops_app/app/data/models/workshop.dart';
import 'package:workshops_app/app/data/providers/api.dart';

class HomeRepository {
  final Api _api;

  HomeRepository(this._api);

  Future<List<WorkshopModel>> getWorkshopCollaborator(searchaWorkshop) =>
      _api.getWorkshopCollaborator(searchaWorkshop);

  Future<List<WorkshopModel>> getWorkshopName(searchaWorkshop) =>
      _api.getWorkshopName(searchaWorkshop);

  Future<List<WorkshopModel>> getWorkshopDate(searchaWorkshop) =>
      _api.getWorkshopDate(searchaWorkshop);
}
