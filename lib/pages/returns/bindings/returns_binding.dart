
import 'package:fusion_warehouses/pages/warehouse_delivery/data/warehouse_api_provider.dart';
import 'package:fusion_warehouses/pages/warehouse_delivery/data/warehouse_repository.dart';
import 'package:get/get.dart';


import '../presentation/controllers/returns_controller.dart';
class ReturnsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IWarehousesProvider>(WarehousesProvider());
    Get.put<IWarehousesRepository>(WarehousesRepository(provider: Get.find()));
    Get.put(ReturnsController(warehousesRepository: Get.find()));
  }
}
