import 'package:workshops_app/app/data/models/workshop.dart';

import 'package:workshops_app/app/data/providers/api.dart';

class WorkshopRepository {
  final Api _api;

  WorkshopRepository(this._api);

  Future<List<WorkshopModel>> getWorkshop(id) => _api.getWorkshop(id);

  // Future<List<WorkshopModel>> getHome(searchaWorkshop) =>
  //     _api.getHome(searchaWorkshop);
}
