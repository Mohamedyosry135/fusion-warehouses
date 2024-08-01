import 'package:fusion_warehouses/base/base_repositroy.dart';
import 'package:fusion_warehouses/pages/login/model/individual.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:get/get.dart';


import 'home_api_provider.dart';

abstract class IHomeRepository {
}

class HomeRepository extends BaseRepository implements IHomeRepository {
  HomeRepository({required this.provider});
  final IHomeProvider provider;


}
