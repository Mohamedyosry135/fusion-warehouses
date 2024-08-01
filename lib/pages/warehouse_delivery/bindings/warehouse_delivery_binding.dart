
import 'package:get/get.dart';

import '../data/warehouse_api_provider.dart';
import '../data/warehouse_repository.dart';
import '../presentation/controllers/warehouse_delivery_controller.dart';
class WarehousesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IWarehousesProvider>(WarehousesProvider());
    Get.put<IWarehousesRepository>(WarehousesRepository(provider: Get.find()));
    Get.put(WarehousesController(warehousesRepository: Get.find()));
  }
}
