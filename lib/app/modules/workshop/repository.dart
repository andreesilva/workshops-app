import 'package:workshops_app/app/data/models/workshop.dart';

import 'package:workshops_app/app/data/providers/api.dart';

class WorkshopRepository {
  final Api _api;

  WorkshopRepository(this._api);

  Future<WorkshopModel> getEnterprise(id) => _api.getWorkshop(id);
}
