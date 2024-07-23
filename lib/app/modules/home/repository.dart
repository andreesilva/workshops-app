import 'package:workshops_app/app/data/models/workshop.dart';
import 'package:workshops_app/app/data/providers/api.dart';

class HomeRepository {
  final Api _api;

  HomeRepository(this._api);

  Future<List<WorkshopModel>> getHome(searchaWorkshop) =>
      _api.getHome(searchaWorkshop);
}
